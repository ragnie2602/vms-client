import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/file_util.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';

import '../bloc/storage_folder/storage_folder_bloc.dart';

class StorageFolderView extends StatefulWidget {
  const StorageFolderView({super.key});

  @override
  State<StorageFolderView> createState() => _StorageFolderViewState();
}

class _StorageFolderViewState extends State<StorageFolderView> {
  late final _videoFolderController = TextEditingController(
    text: context.read<StorageFolderBloc>().state.videoFolder,
  );
  late final _snapshotFolderController = TextEditingController(
    text: context.read<StorageFolderBloc>().state.snapshotFolder,
  );

  @override
  void dispose() {
    _videoFolderController.dispose();
    _snapshotFolderController.dispose();
    super.dispose();
  }

  Future<void> _onSelectFolder(TextEditingController controller, {String? title}) async {
    final path = await FileUtil.selectFolderLocation(
      title: title,
      initialPath: controller.text.isEmpty ? null : controller.text,
    );
    if (path != null) controller.text = path;
  }

  void _onSave() {
    context.read<StorageFolderBloc>().add(
      SaveStorageFolders(
        videoFolder: _videoFolderController.text,
        snapshotFolder: _snapshotFolderController.text,
        onSaved: () => ToastUtil.toastSuccess(
          title: Text(
            "Cấu hình thư mục lưu trữ thành công!",
            style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.white),
          ),
        ),
      ),
    );
  }

  void _onCancel() {
    final state = context.read<StorageFolderBloc>().state;
    _videoFolderController.text = state.videoFolder;
    _snapshotFolderController.text = state.snapshotFolder;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StorageFolderBloc, StorageFolderState>(
      listener: (context, state) {
        _videoFolderController.text = state.videoFolder;
        _snapshotFolderController.text = state.snapshotFolder;
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 565,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Thư mục lưu trữ",
                style: AppTypography.style(
                  16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.grey0F172A,
                ),
              ),

              /*  */
              _buildStorageFolderItem(
                "Thư mục lưu video",
                _videoFolderController,
                prompt: "Chọn thư mục để lưu video",
              ),
              _buildStorageFolderItem(
                "Thư mục lưu ảnh",
                _snapshotFolderController,
                prompt: "Chọn thư mục lưu ảnh",
              ),

              /*  */
              SizedBox(height: 50),
              Row(
                spacing: 12,
                children: <Widget>[
                  _buildButton(
                    title: "Hủy",
                    borderColor: AppColors.greyE2E8F0,
                    bgColor: AppColors.white,
                    textColor: AppColors.black,
                    onPressed: _onCancel,
                  ),
                  _buildButton(
                    title: "Lưu",
                    borderColor: AppColors.secondary,
                    bgColor: AppColors.secondary,
                    textColor: AppColors.white,
                    onPressed: _onSave,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String title,
    required Color bgColor,
    required Color textColor,
    required Color borderColor,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: bgColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          side: BorderSide(color: borderColor, width: 1),
          textStyle: AppTypography.style(14, fontWeight: FontWeight.w700),
          alignment: Alignment.center,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Text(title),
        ),
      ),
    );
  }

  Widget _buildStorageFolderItem(String title, TextEditingController controller, {String? prompt}) {
    return Ink(
      padding: EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: () => _onSelectFolder(controller, title: prompt),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: AppTypography.style(
                14,
                fontWeight: FontWeight.w500,
                color: AppColors.black0D0D0D,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12),
              constraints: BoxConstraints(minWidth: 384, minHeight: 41),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: AppColors.greyE2E8F0),
              ),
              padding: EdgeInsets.all(12),
              alignment: Alignment.centerLeft,
              child: ValueListenableBuilder(
                valueListenable: controller,
                builder: (context, text, child) {
                  return Text(
                    text.text.isEmpty ? "Đang tải ..." : controller.text,
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w400,
                      color: text.text.isEmpty ? AppColors.grey64748B : AppColors.black,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
