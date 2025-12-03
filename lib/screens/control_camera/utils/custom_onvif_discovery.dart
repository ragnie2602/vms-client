import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

class DiscoveredDevice {
  final String name;
  final String xAddr;
  final String hardware;

  DiscoveredDevice({
    required this.name,
    required this.xAddr,
    required this.hardware,
  });
}

class CustomOnvifDiscovery {
  static const int _onvifDiscoveryPort = 3702;
  static const String _multicastAddress = '239.255.255.250';

  /// Scans for ONVIF devices using both Multicast and Unicast (Subnet Scan)
  static Future<List<DiscoveredDevice>> scan({
    Duration timeout = const Duration(seconds: 5),
    bool useMulticast = true,
    bool useSubnetScan = true,
  }) async {
    final Set<String> foundAddresses = {};
    final List<DiscoveredDevice> devices = [];
    final List<Future> tasks = [];

    if (useMulticast) {
      tasks.add(_runMulticastProbe(devices, foundAddresses, timeout));
    }

    if (useSubnetScan) {
      tasks.add(_runSubnetScan(devices, foundAddresses, timeout));
    }

    await Future.wait(tasks);
    return devices;
  }

  static Future<void> _runMulticastProbe(
    List<DiscoveredDevice> devices,
    Set<String> foundAddresses,
    Duration timeout,
  ) async {
    // Get all network interfaces first
    List<NetworkInterface> interfaces = [];
    try {
      interfaces = await NetworkInterface.list();
    } catch (e) {
      print('Failed to list network interfaces: $e');
      return;
    }

    // Filter valid IPv4 interfaces
    final validInterfaces = <InternetAddress>[];
    for (var interface in interfaces) {
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4 && !addr.isLoopback) {
          validInterfaces.add(addr);
        }
      }
    }

    if (validInterfaces.isEmpty) {
      print('No valid network interfaces found');
      return;
    }

    // Create a socket for each interface to ensure multicast works on all networks
    final sockets = <RawDatagramSocket>[];
    final probeMessage = _buildProbeMessage();
    final data = utf8.encode(probeMessage);

    try {
      // Create sockets and send probes for each interface
      for (var localAddr in validInterfaces) {
        try {
          final socket = await RawDatagramSocket.bind(
            localAddr,
            0,
            reuseAddress: true,
          );

          socket.broadcastEnabled = true;
          socket.readEventsEnabled = true;

          // Join multicast group on this interface
          try {
            socket.joinMulticast(InternetAddress(_multicastAddress));
          } catch (e) {
            // Some interfaces may not support multicast, continue anyway
          }

          socket.listen(
            (RawSocketEvent event) {
              if (event == RawSocketEvent.read) {
                try {
                  final datagram = socket.receive();
                  if (datagram != null) {
                    final response = utf8.decode(datagram.data);
                    final match = _parseProbeMatch(
                      response,
                      datagram.address.address,
                    );
                    if (match != null &&
                        !foundAddresses.contains(match.xAddr)) {
                      foundAddresses.add(match.xAddr);
                      devices.add(match);
                    }
                  }
                } catch (e) {
                  // Ignore receive/parse errors
                }
              }
            },
            onError: (error) {
              // Ignore socket errors during listening
            },
            cancelOnError: false,
          );

          sockets.add(socket);

          // Send multicast probe from this interface
          try {
            socket.send(
              data,
              InternetAddress(_multicastAddress),
              _onvifDiscoveryPort,
            );
          } catch (e) {
            // Ignore send errors for this interface
          }

          // Small delay between interface probes
          await Future.delayed(const Duration(milliseconds: 50));
        } catch (e) {
          // Failed to create socket for this interface, try next one
          if (!e.toString().contains('No route to host')) {
            print('Failed to bind socket to ${localAddr.address}: $e');
          }
        }
      }

      // Wait for responses
      await Future.delayed(timeout);
    } catch (e) {
      print('Multicast probe error: $e');
    } finally {
      // Close all sockets
      for (var socket in sockets) {
        try {
          socket.close();
        } catch (e) {
          // Ignore close errors
        }
      }
    }
  }

  static Future<void> _runSubnetScan(
    List<DiscoveredDevice> devices,
    Set<String> foundAddresses,
    Duration timeout,
  ) async {
    try {
      final interfaces = await NetworkInterface.list();
      for (var interface in interfaces) {
        for (var addr in interface.addresses) {
          if (addr.type == InternetAddressType.IPv4 && !addr.isLoopback) {
            await _scanSubnet(addr, devices, foundAddresses, timeout);
          }
        }
      }
    } catch (e) {
      print('Subnet scan error: $e');
    }
  }

  static Future<void> _scanSubnet(
    InternetAddress localIp,
    List<DiscoveredDevice> devices,
    Set<String> foundAddresses,
    Duration timeout,
  ) async {
    final String ip = localIp.address;
    final List<String> parts = ip.split('.');
    if (parts.length != 4) return;

    final String prefix = '${parts[0]}.${parts[1]}.${parts[2]}';
    final probeMessage = _buildProbeMessage();
    final data = utf8.encode(probeMessage);

    RawDatagramSocket? socket;
    try {
      // Bind to the specific local interface instead of anyIPv4
      socket = await RawDatagramSocket.bind(localIp, 0);
      socket.broadcastEnabled = true;

      bool isSocketClosed = false;

      socket.listen(
        (RawSocketEvent event) {
          if (event == RawSocketEvent.read) {
            try {
              final datagram = socket?.receive();
              if (datagram != null) {
                final response = utf8.decode(datagram.data);
                final match = _parseProbeMatch(
                  response,
                  datagram.address.address,
                );
                if (match != null && !foundAddresses.contains(match.xAddr)) {
                  foundAddresses.add(match.xAddr);
                  devices.add(match);
                }
              }
            } catch (e) {
              // Ignore receive errors
            }
          } else if (event == RawSocketEvent.closed) {
            isSocketClosed = true;
          }
        },
        onError: (error) {
          // Ignore socket errors during listening
        },
        cancelOnError: false,
      );

      // Send unicast probes to all IPs in subnet
      // We scan 1-254.
      for (int i = 1; i < 255; i++) {
        if (isSocketClosed) break;

        final targetIp = '$prefix.$i';
        if (targetIp == ip) continue;

        try {
          // Check if socket is still valid before sending
          if (!isSocketClosed) {
            final targetAddr = InternetAddress(targetIp);
            socket.send(data, targetAddr, _onvifDiscoveryPort);
          }
        } catch (e) {
          // Silently ignore send errors for individual IPs
          // This is expected for unreachable hosts
        }

        // Small delay to avoid flooding network buffer
        if (i % 20 == 0) {
          await Future.delayed(const Duration(milliseconds: 10));
        }
      }

      await Future.delayed(timeout);
    } catch (e) {
      // Only log critical socket errors, not individual send failures
      if (!e.toString().contains('No route to host')) {
        print('Subnet scan socket error: $e');
      }
    } finally {
      try {
        socket?.close();
      } catch (e) {
        // Ignore close errors
      }
    }
  }

  static String _buildProbeMessage() {
    final uuid = 'uuid:${_generateUuid()}';
    return '''
<?xml version="1.0" encoding="UTF-8"?>
<e:Envelope xmlns:e="http://www.w3.org/2003/05/soap-envelope"
            xmlns:w="http://schemas.xmlsoap.org/ws/2004/08/addressing"
            xmlns:d="http://schemas.xmlsoap.org/ws/2005/04/discovery"
            xmlns:dn="http://www.onvif.org/ver10/network/wsdl">
  <e:Header>
    <w:MessageID>$uuid</w:MessageID>
    <w:To e:mustUnderstand="true">urn:schemas-xmlsoap-org:ws:2005:04:discovery</w:To>
    <w:Action a:mustUnderstand="true">http://schemas.xmlsoap.org/ws/2005/04/discovery/Probe</w:Action>
  </e:Header>
  <e:Body>
    <d:Probe>
      <d:Types>dn:NetworkVideoTransmitter</d:Types>
    </d:Probe>
  </e:Body>
</e:Envelope>
''';
  }

  static String _generateUuid() {
    final random = Random();
    int s(int n) => random.nextInt(n);
    return '${_hex(s(256))}${_hex(s(256))}-${_hex(s(256))}-${_hex(s(256))}-${_hex(s(256))}-${_hex(s(256))}${_hex(s(256))}${_hex(s(256))}';
  }

  static String _hex(int val) {
    return val.toRadixString(16).padLeft(2, '0');
  }

  static DiscoveredDevice? _parseProbeMatch(String response, String ipAddress) {
    if (!response.contains('ProbeMatches')) return null;

    try {
      // Extract XAddrs
      final xAddrRegex = RegExp(
        r'(?:<.*:XAddrs>)(.*?)(?:</.*:XAddrs>)',
        dotAll: true,
      );
      final xAddrMatch = xAddrRegex.firstMatch(response);
      String xAddrs = '';
      if (xAddrMatch != null) {
        xAddrs = xAddrMatch.group(1)?.trim() ?? '';
        final parts = xAddrs.split(RegExp(r'\s+'));
        if (parts.isNotEmpty) xAddrs = parts.first;
      }

      if (xAddrs.isEmpty) {
        xAddrs = 'http://$ipAddress/onvif/device_service';
      }

      // Extract Scopes to find Hardware/Name
      String hardware = '';
      String name = '';

      final scopesRegex = RegExp(
        r'(?:<.*:Scopes>)(.*?)(?:</.*:Scopes>)',
        dotAll: true,
      );
      final scopesMatch = scopesRegex.firstMatch(response);
      if (scopesMatch != null) {
        final scopes = scopesMatch.group(1)?.trim() ?? '';
        final scopeList = scopes.split(RegExp(r'\s+'));

        for (var scope in scopeList) {
          if (scope.contains('onvif://www.onvif.org/hardware/')) {
            hardware = scope.split('/').last;
          }
          if (scope.contains('onvif://www.onvif.org/name/')) {
            name = scope.split('/').last;
          }
        }
      }

      if (name.isEmpty) name = hardware;
      if (name.isEmpty) name = 'ONVIF Camera';

      return DiscoveredDevice(name: name, xAddr: xAddrs, hardware: hardware);
    } catch (e) {
      print('Parse error: $e');
      return null;
    }
  }
}
