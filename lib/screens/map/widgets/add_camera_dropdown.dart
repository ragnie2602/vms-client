import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

class AddCameraDropdown extends StatefulWidget {
  final Offset position;
  final VoidCallback? onClose;
  final List<CameraEntity> listCamera;
  final Set<String> excludedCameraNames; // Camera đã có trên map
  final Function(CameraEntity camera) onSelectCamera;

  const AddCameraDropdown({
    super.key,
    required this.position,
    this.onClose,
    required this.onSelectCamera,
    required this.listCamera,
    this.excludedCameraNames = const {},
  });

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
    // Lọc bỏ các camera đã được chọn trong session và camera đã có trên map
    final availableCameras = listCameras
        .where(
          (camera) =>
              !_selectedCameras.contains(camera.name) &&
              !widget.excludedCameraNames.contains(camera.name),
        )
        .toList();

    if (query.isEmpty) return availableCameras;
    return availableCameras
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
                            child:
                                listCameras.isNotEmpty &&
                                    _filteredCameras.isNotEmpty
                                ? ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: _filteredCameras.length,
                                    itemBuilder: (context, index) {
                                      final camera = _filteredCameras[index];
                                      final bool isActive = camera.isOnline;

                                      return Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              final name = camera.name;
                                              // Chỉ thêm vào selectedCameras vì camera sẽ biến mất khỏi list
                                              _selectedCameras.add(name);
                                              widget.onSelectCamera(camera);
                                              listCameras.removeWhere(
                                                (element) => listEquals(
                                                  element.id,
                                                  camera.id,
                                                ),
                                              );
                                            });

                                            // Kiểm tra nếu không còn camera nào để chọn thì tự động đóng
                                            Future.microtask(() {
                                              if (_filteredCameras.isEmpty) {
                                                widget.onClose?.call();
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Center(
                                    child: Text(
                                      "Không có camera nào để thêm vào bản đồ",
                                    ),
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
