import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';

class AddCameraDropdown extends StatefulWidget {
  final Offset position;
  final VoidCallback? onClose;
  final List<CameraEntity> listCamera;
  final Function(Set<String> selectedCameras)? onConfirm;

  const AddCameraDropdown({
    Key? key,
    required this.position,
    this.onClose,
    required this.listCamera,
    this.onConfirm,
  }) : super(key: key);

  @override
  State<AddCameraDropdown> createState() => _AddCameraDropdownState();
}

class _AddCameraDropdownState extends State<AddCameraDropdown> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  List<CameraEntity> listCameras = [];

  // Lưu trạng thái chọn của camera
  final Set<String> _selectedCameras = {};

  List<CameraEntity> get _filteredCameras {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) return listCameras;
    return listCameras
        .where((camera) => camera.name.toString().toLowerCase().contains(query))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    listCameras = widget.listCamera;
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
              width: 350,
              height: 500, // Chiều cao cố định cho container
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
                      child: Column(
                        children: [
                          Expanded(
                            child: listCameras.isNotEmpty
                                ? ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: _filteredCameras.length,
                                    itemBuilder: (context, index) {
                                      final camera = _filteredCameras[index];
                                      final bool isActive =
                                          widget.listCamera![index].isOnline;

                                      return Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              final name = camera.name;
                                              if (_selectedCameras.contains(
                                                name,
                                              )) {
                                                _selectedCameras.remove(name);
                                              } else {
                                                _selectedCameras.add(name);
                                              }
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        camera.name,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        camera.isOnline
                                                            ? 'Đang hoạt động'
                                                            : 'Dừng hoạt động',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: AppColors
                                                              .grey64748B,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                _selectedCameras.contains(
                                                      camera.name,
                                                    )
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
                                  )
                                : Text("Không có camera"),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey[200]!,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AppButton.outline(
                                  label: 'Hủy',
                                  onPressed: widget.onClose,
                                ),
                                const SizedBox(width: 8),
                                AppButton.filled(
                                  label: 'Xác nhận',
                                  onPressed: () {
                                    widget.onConfirm?.call(_selectedCameras);
                                    widget.onClose?.call();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
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
