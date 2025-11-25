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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 12),
        Text(
          'Thêm camera bằng file',
          style: AppTypography.style(
            16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Khu vực này sẽ cho phép bạn chọn file (ví dụ: CSV / Excel) để import danh sách camera.',
          style: AppTypography.style(
            13,
            fontWeight: FontWeight.w400,
            color: AppColors.grey64748B,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.greyE2E8F0),
          ),
          child: Text(
            'TODO: Gắn UI chọn file và logic import camera từ file tại đây.',
            style: AppTypography.style(
              13,
              fontWeight: FontWeight.w400,
              color: AppColors.grey64748B,
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
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
