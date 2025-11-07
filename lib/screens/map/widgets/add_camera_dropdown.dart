import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

class AddCameraDropdown extends StatefulWidget {
  final Offset position;
  final VoidCallback? onClose;
  final Function(String cameraName) onSelectCamera;

  const AddCameraDropdown({
    super.key,
    required this.position,
    this.onClose,
    required this.onSelectCamera,
  });

  @override
  State<AddCameraDropdown> createState() => _AddCameraDropdownState();
}

class _AddCameraDropdownState extends State<AddCameraDropdown> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;

  // Lưu trạng thái chọn của camera
  final Set<String> _selectedCameras = {};

  // Danh sách camera mẫu - sẽ được thay thế bằng dữ liệu thực tế
  final List<Map<String, dynamic>> _cameras = [
    {'name': 'Camera cửa chính', 'status': 'Đang hoạt động', 'isActive': true},
    {
      'name': 'Camera phòng khách',
      'status': 'Đang hoạt động',
      'isActive': true,
    },
    {'name': 'Camera phòng ngủ', 'status': 'Đang hoạt động', 'isActive': true},
    {'name': 'Camera Tầng 10', 'status': 'Dừng hoạt động', 'isActive': false},
  ];

  List<Map<String, dynamic>> get _filteredCameras {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) return _cameras;
    return _cameras
        .where(
          (camera) => camera['name'].toString().toLowerCase().contains(query),
        )
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: widget.onClose,
          child: Container(color: Colors.transparent),
        ),
        Positioned(
          right: 20,
          top: 100,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 320,
              height: 400, // Chiều cao cố định cho container
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: widget.onClose,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          iconSize: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Nhập tên camera',
                          prefixIcon: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 12,
                            ),
                            child: SvgPicture.asset(AppAssets.icSearch),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        onChanged: (value) => setState(() {}),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (_isLoading)
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        physics: const BouncingScrollPhysics(),
                        itemCount: _filteredCameras.length,
                        itemBuilder: (context, index) {
                          final camera = _filteredCameras[index];
                          final bool isActive = camera['isActive'] as bool;

                          return Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  final name = camera['name'] as String;
                                  if (_selectedCameras.contains(name)) {
                                    _selectedCameras.remove(name);
                                  } else {
                                    _selectedCameras.add(name);
                                  }
                                  widget.onSelectCamera(name);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    isActive
                                        ? SvgPicture.asset(
                                            AppAssets.icVideoOn,
                                            width: 20,
                                            height: 20,
                                          )
                                        : SvgPicture.asset(
                                            AppAssets.icVideoOff,
                                            width: 20,
                                            height: 20,
                                          ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            camera['name'] as String,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            camera['status'] as String,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.grey64748B,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    _selectedCameras.contains(camera['name'])
                                        ? SvgPicture.asset(
                                            AppAssets.icChecked,
                                            width: 20,
                                            height: 20,
                                          )
                                        : SvgPicture.asset(
                                            AppAssets.icCheckBox,
                                            width: 20,
                                            height: 20,
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
