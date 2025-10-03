import 'dart:typed_data';

import 'package:vms_flutter_client/core/constants/api_constants.dart';

const int _MAGIC_BYTES = 0xEE;
const int _AND_BIT = 0xFF;
const int _FLAG = 2;
const int _PACKET_HEADER_SIZE = 8;

class Packet {
  final int id;
  final PacketType type;
  final List<int> data;
  int size;

  Packet({required this.id, required this.data, required this.type, this.size = 0});

  /// | 0xEE | 0xEE | size (3 bytes) | type (2 bytes) | flag | id (8 bytes) | data |
  Uint8List writeToBuffer() {
    size = _PACKET_HEADER_SIZE + 8 + data.length;
    final message = <int>[];

    // Magic bytes
    message.add(_MAGIC_BYTES);
    message.add(_MAGIC_BYTES);

    // size
    message.add((size >> 16) & _AND_BIT);
    message.add((size >> 8) & _AND_BIT);
    message.add(size & _AND_BIT);

    // type
    message.add((type.value >> 8) & _AND_BIT);
    message.add(type.value & _AND_BIT);

    // flag
    message.add(_FLAG);

    // id
    message.add((id >> 56) & _AND_BIT);
    message.add((id >> 48) & _AND_BIT);
    message.add((id >> 40) & _AND_BIT);
    message.add((id >> 32) & _AND_BIT);
    message.add((id >> 24) & _AND_BIT);
    message.add((id >> 16) & _AND_BIT);
    message.add((id >> 8) & _AND_BIT);
    message.add(id & _AND_BIT);

    // data
    message.addAll(data);

    return Uint8List.fromList(message);
  }

  factory Packet.fromBuffer(List<int> raw) {
    final buffer = Uint8List.fromList(raw);

    // Parse size
    final size = (buffer[2] << 16) + (buffer[3] << 8) + buffer[4];
    final type = (buffer[5] << 8) + buffer[6];

    int sizeCut = _PACKET_HEADER_SIZE;
    int id = 0;

    // Nếu có flag -> parse messageId
    if ((buffer[7] & 0x02) == _FLAG) {
      sizeCut += 8;
      id = buffer[8];
      for (int i = 9; i <= 15; i++) {
        id = (id << 8) + buffer[i];
      }
    }

    // Lấy phần data còn lại
    final data = buffer.sublist(sizeCut);

    return Packet(id: id, data: data, type: PacketType.fromValue(type), size: size);
  }
}
