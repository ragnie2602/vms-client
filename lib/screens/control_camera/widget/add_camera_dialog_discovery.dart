part of 'dialog.dart';

extension AddCameraDialogDiscovery on _AddCameraDialogState {
  /// Bước dò tìm camera (hiện tại để placeholder, sẽ gắn logic dò tìm sau)
  Widget _buildDiscoveryContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          'Dò tìm camera',
          style: AppTypography.style(
            16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Nhấn để tìm camera ONVIF trong cùng mạng và thêm vào hệ thống. Vui lòng đảm bảo đã bật camera',
          style: AppTypography.style(
            13,
            fontWeight: FontWeight.w400,
            isItalic: true,
            color: AppColors.grey64748B,
          ),
          overflow: TextOverflow.visible,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            InkWell(
              onTap: () async {
                updateState(() {
                  _isCheckingDiscovery = true;
                  _expandedDiscoveryIndex = null;
                });
                _deviceMatches = await widget.onCheckDiscovery?.call();
                updateState(() {
                  _isCheckingDiscovery = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.blue005AA9),
                ),
                child: Text(
                  'Tìm kiếm',
                  style: AppTypography.style(
                    13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blue005AA9,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isCheckingDiscovery,
              child: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.blue005AA9,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        if (_deviceMatches != null)
          _deviceMatches!.isEmpty
              ? Text(
                  'Không tìm thấy camera ONVIF nào.',
                  style: AppTypography.style(
                    13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey64748B,
                  ),
                )
              : Column(
                  children: [
                    const Divider(height: 1, color: AppColors.greyE2E8F0),
                    ..._deviceMatches!.asMap().entries.map(
                      (entry) => _buildDiscoveryItem(
                        match: entry.value,
                        index: entry.key,
                      ),
                    ),
                  ],
                ),
      ],
    );
  }

  Widget _buildDiscoveryItem({
    required DiscoveredDevice match,
    required int index,
  }) {
    final isExpanded = _expandedDiscoveryIndex == index;

    final uri = Uri.tryParse(match.xAddr);
    final ip = uri?.host.isNotEmpty == true ? uri!.host : match.xAddr;
    final model = match.hardware.isNotEmpty ? match.hardware : '';

    Widget buildHeader(TextStyle textStyle) {
      return Row(
        children: [
          const Icon(Icons.videocam_outlined, size: 18, color: AppColors.black),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              model != '' ? '$ip - Model: $model' : ip,
              style: textStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    if (!isExpanded) {
      return Column(
        children: [
          InkWell(
            onTap: () {
              updateState(() {
                _expandedDiscoveryIndex = index;
                _onvifXaddrs.text = match.xAddr;
                if (_onvifUserName.text.isEmpty) {
                  _onvifUserName.text = 'Admin';
                }
              });
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: buildHeader(
                AppTypography.style(
                  14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          const Divider(height: 1, color: AppColors.greyE2E8F0),
        ],
      );
    }

    return Column(
      children: [
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.greyF2F4FA,
            borderRadius: BorderRadius.circular(4),
          ),
          child: _buildDiscoveryItemForm(match),
        ),
        const SizedBox(height: 8),
        const Divider(height: 1, color: AppColors.greyE2E8F0),
      ],
    );
  }

  Widget _buildDiscoveryItemForm(DiscoveredDevice match) {
    final uri = Uri.tryParse(match.xAddr);
    final ip = uri?.host.isNotEmpty == true ? uri!.host : match.xAddr;

    return Form(
      key: _discoveryFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              updateState(() {
                _expandedDiscoveryIndex = null;
              });
            },
            child: Row(
              children: [
                const Icon(
                  Icons.videocam_outlined,
                  size: 18,
                  color: AppColors.black,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${Uri.tryParse(match.xAddr)?.host ?? match.xAddr} - Model: ${match.hardware.isNotEmpty ? match.hardware : ''}',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Tài khoản camera',
            style: AppTypography.style(
              13,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          AppField(controller: _onvifUserName, hintText: 'Admin', label: ''),
          const SizedBox(height: 16),
          Text(
            'Mật khẩu camera',
            style: AppTypography.style(
              13,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          AppField(
            controller: _onvifPassword,
            hintText: '********',
            label: '',
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
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 36,
                child: AppButton.outline(
                  label: 'Thêm và Sửa',
                  onPressed: () {
                    updateState(() {
                      _step = AddCameraStep.manualForm;
                      _method = 'ONVIF';
                      _name.text = match.name;
                    });
                    if (_onvifUserName.text.isNotEmpty &&
                        _onvifPassword.text.isNotEmpty) {
                      _onCheckPassword();
                    }
                  },
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 36,
                child: AppButton.filled(
                  label: 'Thêm',
                  onPressed: () {
                    if (_discoveryFormKey.currentState?.validate() ?? false) {
                      updateState(() {
                        _isAddingDiscoveryCamera = true;
                        _name.text = ip;
                      });
                      _onCheckPassword();
                    }
                  },
                  child: _isAddingDiscoveryCamera
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
