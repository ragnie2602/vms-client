part of 'dialog.dart';

extension AddCameraDialogForm on _AddCameraDialogState {
  Widget _buildManualForm() {
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppField(
            controller: _name,
            hintText: 'Nhập tên camera',
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'Tên camera không được để trống';
              }
              return null;
            },
            label: 'Tên camera',
            requiredField: true,
            maxLength: 50,
          ),
          SizedBox(height: 20),
          // Phương thức selection
          _buildMethodCamera(),
          _buildAccountCamera(),
          SizedBox(height: 20),
          AppField(
            controller: _rtsp,
            hintText: 'Nhập địa chỉ RTSP',
            keyboardType: TextInputType.url,
            label: 'Địa chỉ RTSP',
            requiredField: true,
            validator: (v) => v == null || v.trim().isEmpty
                ? 'Địa chỉ RTSP không được để trống'
                : null,
          ),
          SizedBox(height: 20),
          AppField(
            controller: _sub,
            hintText: 'Nhập địa chỉ luồng phụ',
            label: 'Địa chỉ luồng phụ',
            // validator: (v) => v == null || v.trim().isEmpty
            //     ? 'Địa chỉ luồng phụ không được để trống'
            //     : null,
          ),
          // const SizedBox(height: 20),
          // AppField(
          //   controller: _desc,
          //   hintText: 'Nhập địa chỉ khu vực',
          //   label: "Địa chỉ khu vực",
          //   maxLength: 50,
          // ),
          const SizedBox(height: 20),
          Text(
            'Tags',
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 12),
          _TagField(_tags),
        ],
      ),
    );
  }

  /// Bước 1: chọn cách thêm camera
  Widget _buildSelectMode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Chọn phương thức thêm camera',
          style: AppTypography.style(
            14,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 12),
        _buildSelectModeOption(
          label: 'Thêm thủ công',
          value: AddCameraStep.manualForm,
        ),
        const SizedBox(height: 12),
        _buildSelectModeOption(
          label: 'Dò tìm camera',
          value: AddCameraStep.discovery,
        ),
        const SizedBox(height: 12),
        _buildSelectModeOption(
          label: 'Thêm bằng file',
          value: AddCameraStep.importFile,
        ),
      ],
    );
  }

  Widget _buildSelectModeOption({
    required String label,
    required AddCameraStep value,
  }) {
    return InkWell(
      onTap: () {
        updateState(() {
          _selectedAddStep = value;
        });
      },
      child: CustomRadioButton(
        value: value,
        title: label,
        groupValue: _selectedAddStep,
        onChanged: (v) {
          if (v == null) return;
          updateState(() {
            _selectedAddStep = v;
          });
        },
      ),
    );
  }

  /// Bước thêm bằng file (placeholder – sẽ gắn import file sau)
  Widget _buildImportFileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                style: AppTypography.style(
                  16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Upload file ',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey334155,
                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: AppTypography.style(
                      16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.redFF0000,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                final byteData = await rootBundle.load(
                  AppAssets.cameraTemplateImport,
                );
                String? outputFile = await FileUtil.selectSaveLocation(
                  'Camera_Template_Import.xlsx',
                  'xlsx',
                );

                if (outputFile != null) {
                  try {
                    // Thử ghi đúng vào đường dẫn user đã chọn
                    try {
                      final file = File(outputFile);
                      await file.writeAsBytes(
                        byteData.buffer.asUint8List(
                          byteData.offsetInBytes,
                          byteData.lengthInBytes,
                        ),
                      );
                      ToastUtil.toastSuccess(
                        title: Text('Tải file mẫu thành công'),
                      );
                      return;
                    } on FileSystemException {
                      // Trường hợp phổ biến trên macOS: user chọn thư mục không có quyền (vd: /Users)
                      // → fallback sang thư mục Documents của user
                      final safePath = await FileUtil.getSafeUserFilePath(
                        'Camera_Template_Import.xlsx',
                      );
                      final safeFile = File(safePath);
                      await safeFile.writeAsBytes(
                        byteData.buffer.asUint8List(
                          byteData.offsetInBytes,
                          byteData.lengthInBytes,
                        ),
                      );
                      ToastUtil.toastSuccess(
                        title: Text(
                          'Tải file mẫu thành công.\nĐã lưu tại: $safePath',
                        ),
                      );
                    }
                  } catch (e) {
                    ToastUtil.toastFail(title: Text('Lỗi ghi file mẫu: $e'));
                  }
                }
              },
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.icDownloadFile),
                  SizedBox(width: 4),
                  Text(
                    'Tải file mẫu',
                    style: AppTypography.style(
                      13,
                      fontWeight: FontWeight.w500,
                      isItalic: true,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.blue15ABFF,
                      color: AppColors.blue15ABFF,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Vui lòng chọn tệp danh sách camera có định dạng giống file mẫu để import vào hệ thống',
          style: AppTypography.style(
            13,
            fontWeight: FontWeight.w400,
            isItalic: true,
            color: AppColors.grey64748B,
          ),
        ),
        const SizedBox(height: 16),
        _excelFileResult == null
            ? InkWell(
                onTap: () async {
                  _excelFileResult = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['xlsx'], // Chỉ cho phép file Excel mới
                    allowMultiple: false,
                  );
                  updateState(() {
                    _isExcelFormatError = false; // Reset flag khi chọn file mới
                  });
                },
                child: _buildAddFileBox(),
              )
            : _buildFileBox(),
      ],
    );
  }

  Widget _buildAddFileBox() {
    return SizedBox(
      width: double.infinity,
      child: CustomPaint(
        painter: DashedBorderPainter(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: SvgPicture.asset(
            AppAssets.icAdd,
            width: 36,
            height: 36,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildFileBox() {
    return SizedBox(
      width: double.infinity,
      child: CustomPaint(
        painter: DashedBorderPainter(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppAssets.icFile),
                  SizedBox(width: 10),
                  Text(
                    '${_excelFileResult?.files.first.name}',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  updateState(() {
                    _excelFileResult = null;
                    _isExcelFormatError = false; // Reset flag khi xóa file
                    importCameraEntity = null; // Reset entity khi xóa file
                    _importProgress = 0.0; // Reset progress
                  });
                },
                icon: SvgPicture.asset(AppAssets.icCloseFilled),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImportFileResultContent() {
    // Bắt đầu import nếu progress = 0
    if (_importProgress == 0.0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _startImport();
      });
    }

    // Hiển thị progress bar
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${(_importProgress * 100).toInt()}%',
              style: AppTypography.style(
                24,
                fontWeight: FontWeight.w600,
                color: AppColors.blue15ABFF,
              ),
            ),
            SizedBox(width: 10),
            Text(
              importCameraEntity != null
                  ? 'Tải file lên thành công'
                  : 'Đang tải lên...',
              style: AppTypography.style(
                13,
                fontWeight: FontWeight.w400,
                lineHeight: 18 / 12,
                isItalic: true,
                color: AppColors.grey6F6F6F,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: _importProgress,
            minHeight: 12,
            backgroundColor: AppColors.blue15ABFF,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue15ABFF),
          ),
        ),
        Visibility(
          visible: importCameraEntity != null || _isExcelFormatError,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                child: _buildTextResult(),
              ),
              Visibility(
                visible:
                    (importCameraEntity?.cameras.isNotEmpty ?? false) &&
                    (importCameraEntity?.cameraError.isNotEmpty ?? false),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: importCameraEntity?.cameraError.length ?? 0,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppAssets.icError),
                            SizedBox(width: 10),
                            SvgPicture.asset(AppAssets.icVideoOn),
                            SizedBox(width: 16),
                            Text(
                              importCameraEntity
                                      ?.cameraError[index]
                                      .cameraName ??
                                  '',
                              style: AppTypography.style(
                                14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 0.5, color: AppColors.greyE2E8F0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextResult() {
    // Nếu có lỗi định dạng file Excel, hiển thị error text
    if (_isExcelFormatError) {
      return _buildErrorText();
    }

    if (importCameraEntity?.cameraError.isEmpty ?? false) {
      return _buildSuccessText();
    } else if (importCameraEntity?.cameraError.isNotEmpty ?? false) {
      if (importCameraEntity?.cameras.isNotEmpty ?? false) {
        return _buildSuccessAndError();
      } else {
        return _buildErrorText();
      }
    }
    return _buildErrorText();
  }

  Widget _buildErrorText() {
    return Text(
      'Thêm mới camera thất bại. Vui lòng kiểm tra định dạng file hoặc thông tin camera và thử lại.',
      style: AppTypography.style(
        14,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    );
  }

  Widget _buildSuccessText() {
    return RichText(
      text: TextSpan(
        style: AppTypography.style(
          14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        children: [
          TextSpan(text: 'Thêm mới thành công '),
          TextSpan(
            text: () {
              final successCount = importCameraEntity?.cameras.length ?? 0;
              final successStr = successCount == 0
                  ? '0'
                  : successCount.toString().padLeft(2, '0');
              return '$successStr/$successStr';
            }(),
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: AppColors.blue005AA9,
            ),
          ),
          TextSpan(text: ' camera'),
        ],
      ),
    );
  }

  Widget _buildSuccessAndError() {
    return RichText(
      text: TextSpan(
        style: AppTypography.style(
          14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        children: [
          TextSpan(text: 'Tải lên thành công '),
          TextSpan(
            text: () {
              final successCount = importCameraEntity?.cameras.length ?? 0;
              final totalCount =
                  (importCameraEntity?.cameras.length ?? 0) +
                  (importCameraEntity?.cameraError.length ?? 0);
              final successStr = successCount == 0
                  ? '0'
                  : successCount.toString().padLeft(2, '0');
              final totalStr = totalCount == 0
                  ? '0'
                  : totalCount.toString().padLeft(2, '0');
              return '$successStr/$totalStr';
            }(),
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: AppColors.blue005AA9,
            ),
          ),
          TextSpan(text: ' camera, '),
          TextSpan(
            text: () {
              final errorCount = importCameraEntity?.cameraError.length ?? 0;
              return errorCount == 0
                  ? '0'
                  : errorCount.toString().padLeft(2, '0');
            }(),
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: AppColors.redFF0909,
            ),
          ),
          TextSpan(text: ' camera không tải lên thành công.'),
        ],
      ),
    );
  }

  Future<void> _startImport() async {
    try {
      // Reset error flag
      _isExcelFormatError = false;

      await ExcelUtils.importExcelFile(
        excelFileResult: _excelFileResult,
        onProgress: (progress) {
          updateState(() {
            _importProgress = progress;
          });
        },
        onImport: (cameras) async {
          await widget.onImport?.call(cameras);
        },
      );
    } on ExcelFormatException catch (e) {
      // Lỗi định dạng file Excel - hiển thị trong UI
      if (mounted) {
        updateState(() {
          _isExcelFormatError = true;
          // Set importCameraEntity để trigger hiển thị text result
          importCameraEntity = ImportCameraEntity(cameras: [], cameraError: []);
        });
      }
    } catch (e) {
      // Các lỗi khác vẫn hiển thị toast như cũ
      if (mounted) {
        ToastUtil.toastFail(title: Text('Lỗi import file: $e'));
      }
    }
  }

  Widget _buildAccountCamera() {
    return Column(
      children: [
        Visibility(
          visible: _method != 'RTSP',
          child: Column(
            children: [
              const SizedBox(height: 12),
              AppField(
                controller: _onvifXaddrs,
                hintText: 'Nhập địa chỉ ONVIF',
                label: 'Địa chỉ ONVIF',
                requiredField: true,
                readOnly: widget.mode == CameraDialogMode.edit,
                validator: (v) {
                  if (_method != 'RTSP' && (v == null || v.trim().isEmpty)) {
                    return 'Địa chỉ ONVIF không được để trống';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: AppField(
                controller: _onvifUserName,
                hintText: 'Nhập tài khoản camera',
                label: 'Tài khoản camera',
                requiredField: true,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Tài khoản camera không được để trống'
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: _method != 'RTSP' ? 3 : 2,
              child: AppField(
                controller: _onvifPassword,
                hintText: 'Nhập mật khẩu',
                label: 'Mật khẩu camera',
                requiredField: true,
                maxLength: 50,
                obscureText: _obscure,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Mật khẩu camera không được để trống'
                    : null,
                suffix: IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.black,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
                trailingButton: Visibility(
                  visible: _method != 'RTSP',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: ElevatedButton(
                      onPressed: _isChecking
                          ? null
                          : () {
                              _onCheckPassword();
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue005AA9,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        elevation: 0,
                      ),
                      child: _isChecking
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : Text(
                              'Kiểm tra',
                              style: AppTypography.style(
                                14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMethodCamera() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Phương thức',
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF000000),
            ),
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            CustomRadioButton(
              title: 'ONVIF',
              value: 'ONVIF',
              readonly: widget.mode == CameraDialogMode.edit,
              groupValue: _method,
              onChanged: (value) {
                if (value == null) return;
                updateState(() => _method = value);
              },
            ),
            const SizedBox(width: 24),
            CustomRadioButton(
              title: 'RTSP',
              value: 'RTSP',
              readonly: widget.mode == CameraDialogMode.edit,
              groupValue: _method,
              onChanged: (value) {
                if (value == null) return;
                updateState(() => _method = value);
              },
            ),
          ],
        ),
      ],
    );
  }
}
