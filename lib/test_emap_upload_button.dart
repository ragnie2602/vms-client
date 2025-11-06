import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_emap_repository.dart';
import 'package:file_picker/file_picker.dart';

class TestEmapUploadButton extends StatefulWidget {

  const TestEmapUploadButton({
    super.key,
  });

  @override
  State<TestEmapUploadButton> createState() => _TestEmapUploadButtonState();
}

class _TestEmapUploadButtonState extends State<TestEmapUploadButton> {
  bool _isLoading = false;
  String? _lastResult;

  Future<void> _testUploadEmap() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _lastResult = null;
    });

    try {
      // Check if user is authenticated
      final profile = AppData.instance.profile;
      if (profile == null) {
        setState(() {
          _lastResult = 'ERROR: User not authenticated. Please login first.';
          _isLoading = false;
        });
        return;
      }

      // Pick an image file
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result == null || result.files.isEmpty) {
        setState(() {
          _lastResult = 'File selection cancelled';
          _isLoading = false;
        });
        return;
      }

      final filePath = result.files.first.path;
      if (filePath == null) {
        setState(() {
          _lastResult = 'ERROR: Could not get file path';
          _isLoading = false;
        });
        return;
      }

      final imageFile = File(filePath);
      final imageBytes = await imageFile.readAsBytes();

      Logger.log('Starting emap upload test...', tag: 'EMAP_TEST');
      Logger.log('Image: $filePath (${imageBytes.length} bytes)', tag: 'EMAP_TEST');

      // Get repository from DI
      final emapRepository = context.read<IEmapRepository>();

      // Test postEmap
      final uploadResult = await emapRepository.postEmap(
        // serverUrl: AppData.instance.read<String>(AppKeys.SP_SERVER_KEY) ?? '',
        emapName: 'Test Emap ${DateTime.now().millisecondsSinceEpoch}',
        imagePath: filePath,
        imageBytes: imageBytes,
      );

      uploadResult.fold(
        (failure) {
          Logger.error('Failed to upload emap: ${failure}', tag: 'EMAP_TEST');
          setState(() {
            _lastResult = 'UPLOAD FAILED: ${failure}';
            _isLoading = false;
          });
        },
        (emap) {
          Logger.log('Successfully uploaded emap!', tag: 'EMAP_TEST');
          Logger.log('Emap ID: ${emap.emapId}', tag: 'EMAP_TEST');
          Logger.log('Emap Name: ${emap.emapName}', tag: 'EMAP_TEST');
          Logger.log('Background Path: ${emap.backgroundPath}', tag: 'EMAP_TEST');

          setState(() {
            _lastResult = 'SUCCESS!\n'
                'Name: ${emap.emapName}\n'
                'Path: ${emap.backgroundPath}';
          });

          // Also test listing emaps
          _testListEmaps();
        },
      );
    } catch (e, stackTrace) {
      Logger.error('Test failed with exception: $e', tag: 'EMAP_TEST');
      Logger.error(stackTrace.toString(), tag: 'EMAP_TEST');
      setState(() {
        _lastResult = 'EXCEPTION: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _testListEmaps() async {
    try {
      final emapRepository = context.read<IEmapRepository>();

      Logger.log('Fetching emap list...', tag: 'EMAP_TEST');
      final listResult = await emapRepository.listEmap();

      listResult.fold(
        (failure) {
          Logger.error('Failed to fetch emaps: ${failure}', tag: 'EMAP_TEST');
        },
        (emaps) {
          Logger.log('Found ${emaps.length} emaps', tag: 'EMAP_TEST');
          for (var emap in emaps) {
            Logger.log('  - ${emap.emapName} (${emap.backgroundPath})', tag: 'EMAP_TEST');
          }

          setState(() {
            _lastResult = '${_lastResult ?? ""}\n\n'
                'Total emaps in system: ${emaps.length}';
            _isLoading = false;
          });
        },
      );
    } catch (e) {
      Logger.error('List test failed: $e', tag: 'EMAP_TEST');
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'TEMP: Emap Upload Test',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Server: ${AppData.instance.read<String>(AppKeys.SP_SERVER_KEY) ?? ''}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _testUploadEmap,
              icon: _isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.upload_file),
              label: Text(_isLoading ? 'Uploading...' : 'Test Upload Emap'),
            ),
            if (_lastResult != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _lastResult!.startsWith('SUCCESS')
                      ? Colors.green.withOpacity(0.1)
                      : Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _lastResult!.startsWith('SUCCESS')
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                child: Text(
                  _lastResult!,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'monospace',
                    color: _lastResult!.startsWith('SUCCESS')
                        ? Colors.green.shade900
                        : Colors.red.shade900,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 8),
            const Text(
              'Note: You must be logged in to test. Check console logs for details.',
              style: TextStyle(fontSize: 10, color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
