import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_emap_repository.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_input.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_output.dart';
import 'package:vms_flutter_client/domain/usecases/emap/search_emap_use_case.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_event.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_state.dart';
import 'package:vms_flutter_client/screens/map/model/drag_item_model.dart';

class EmapBloc extends BaseBloc<EmapEvent, EmapState> {
  List<CameraEntity> listCamera = [];
  final IEmapRepository emapRepository;
  final SearchEmapUseCase searchEmapUseCase;
  EmapBloc({required this.emapRepository, required this.searchEmapUseCase})
    : super(const EmapState()) {
    on<AddEmapEvent>(_onAddEmap);
    on<GetListEmapEvent>(_onGetListEmap);
    on<RemoveEmapEvent>(_onRemoveEmap);
    on<EditEmapEvent>(_onEditEmap);

    on<AddCameraEmapEvent>(_addCameraEmapInfo);
    on<AddDragItemEvent>(_onAddDragItem);
    on<UpdateDragItemPositionEvent>(_onUpdateDragItemPosition);
    on<RemoveDragItemEvent>(_onRemoveDragItem);
    on<ListCameraEmapInfoEvent>(_onlistCameraEmapInfo);
    on<UpdateCameraEmapPositionEvent>(_onUpdateCameraEmapPosition);
    on<RemoveCameraEmapEvent>(_onRemoveCameraEmap);
    on<SearchEmapEvent>(_onSearchEmap);
  }

  FutureOr<void> _onAddEmap(AddEmapEvent event, Emitter<EmapState> emit) async {
    emit(EmapLoadingState());

    final res = await emapRepository.postEmap(emapName: event.emapName, imageFile: event.imageFile);
    res.fold((onFailure) {}, (onSuccess) => emit(AddEmapSuccessState(onSuccess)));
  }

  FutureOr<void> _onEditEmap(EditEmapEvent event, Emitter<EmapState> emit) async {
    emit(EmapLoadingState());

    final res = await emapRepository.editEmap(
      emapId: event.emapId,
      emapName: event.emapName,
      imageFile: event.imageFile,
    );
    res.fold((onFailure) {}, (onSuccess) => emit(EditEmapSuccessState(onSuccess)));
  }

  FutureOr<void> _onGetListEmap(GetListEmapEvent event, Emitter<EmapState> emit) async {
    emit(EmapLoadingState());

    final emaps = await emapRepository.listEmap();
    emaps.fold((onFailure) {}, (onSuccess) => emit(EmapSuccessState(listEmap: onSuccess)));
  }

  FutureOr<void> _onRemoveEmap(RemoveEmapEvent event, Emitter<EmapState> emit) async {
    final res = await emapRepository.removeEmap(event.emapId);
    res.fold((onFailure) {}, (onSuccess) => emit(RemoveEmapSucessSate(onSuccess)));
  }

  Future<void> _onSearchEmap(SearchEmapEvent event, Emitter<EmapState> emit) async {
    final SearchEmapOutput output = searchEmapUseCase.execute(
      SearchEmapInput(keyword: event.keyword, listEmapOrigin: event.listEmap),
    );
    emit(SearchEmapSuccessState(listEmap: output.listEmapResult));
  }

  FutureOr<void> _addCameraEmapInfo(AddCameraEmapEvent event, Emitter<EmapState> emit) async {
    final res = await emapRepository.addCameraEmapInfo(
      emapId: event.emapId,
      xRatio: event.cameraEmapInfoEntity.xRatio,
      yRatio: event.cameraEmapInfoEntity.yRatio,
      camId: event.cameraEmapInfoEntity.cameraId,
    );
    res.fold((onFailure) {}, (onSuccess) => emit(EditEmapSuccessState(onSuccess)));
  }

  // Handler thêm item mới
  FutureOr<void> _onAddDragItem(AddDragItemEvent event, Emitter<EmapState> emit) {
    final currentState = state as EmapSuccessState;
    final updatedItems = List<DragItemModel>.from(currentState.dragItems ?? [])..add(event.item);

    emit(currentState.copyWith(dragItems: updatedItems));
  }

  // Handler cập nhật vị trí item
  FutureOr<void> _onUpdateDragItemPosition(
    UpdateDragItemPositionEvent event,
    Emitter<EmapState> emit,
  ) {
    final currentState = state as EmapSuccessState;
    final updatedItems = currentState.dragItems?.map((item) {
      if (item.id == event.itemId) {
        return item.copyWith(position: event.newPosition);
      }
      return item;
    }).toList();

    emit(currentState.copyWith(dragItems: updatedItems));
  }

  // Handler xóa item
  FutureOr<void> _onRemoveDragItem(RemoveDragItemEvent event, Emitter<EmapState> emit) {
    final currentState = state as EmapSuccessState;
    final updatedItems = currentState.dragItems?.where((item) => item.id != event.itemId).toList();

    emit(currentState.copyWith(dragItems: updatedItems));
  }

  FutureOr<void> _onlistCameraEmapInfo(
    ListCameraEmapInfoEvent event,
    Emitter<EmapState> emit,
  ) async {
    // if (state is! EmapSuccessState) return;

    // final currentState = state as EmapSuccessState;
    // final res = await emapRepository.listCameraEmapInfo(
    //   emapId: currentState.emapSelected?.emapId ?? [],
    // );

    // res.fold(
    //   (onFailure) {
    //     debugPrint('Load camera emap info failed: $onFailure');
    //   },
    //   (onSuccess) {
    //     // Kiểm tra emit.isDone trước khi emit để tránh lỗi
    //     if (emit.isDone) return;

    //     final dragItems = onSuccess
    //         .map((e) {
    //           // Tìm camera tương ứng trong danh sách camera tổng
    //           final cameraList = currentState.listCamera?.where(
    //             (element) => listEquals(element.id, e.cameraId),
    //           );

    //           // Nếu tìm thấy camera, tạo DragItemModel
    //           if (cameraList != null && cameraList.isNotEmpty) {
    //             final camera = cameraList.first;
    //             return DragItemModel(
    //               id: e.cameraId.toString(),
    //               position: Offset(e.xCoordinate.toDouble(), e.yCoordinate.toDouble()),
    //               label: camera.name,
    //               cameraId: e.cameraId.toString(),
    //               cameraEmapInfoId: e.cameraEmapInfoId, // Lưu ID để update sau này
    //               source: camera.subStreamUri.toString(),
    //             );
    //           }

    //           // Nếu không tìm thấy, trả về null để lọc ra sau
    //           return null;
    //         })
    //         .whereType<DragItemModel>()
    //         .toList(); // Lọc bỏ các giá trị null

    //     emit(currentState.copyWith(dragItems: dragItems));
    //   },
    // );
  }

  // Update vị trí camera trên emap
  FutureOr<void> _onUpdateCameraEmapPosition(
    UpdateCameraEmapPositionEvent event,
    Emitter<EmapState> emit,
  ) async {
    // if (state is! EmapSuccessState) return;

    // // Gọi API addCameraEmapInfo với cameraEmapInfoId đã có để update
    // final res = await emapRepository.addCameraEmapInfo(
    //   emapId: event.emapId,
    //   cameraEmapinfo: CameraEmapInfoEntity(
    //     cameraId: event.cameraId,
    //     typeIcon: event.typeIcon,
    //     xCoordinate: event.newPosition.dx.toInt(),
    //     yCoordinate: event.newPosition.dy.toInt(),
    //     cameraEmapInfoId: event.cameraEmapInfoId, // ID đã có -> server sẽ update
    //   ),
    // );

    // res.fold(
    //   (onFailure) {
    //     debugPrint('Update camera emap position failed: $onFailure');
    //   },
    //   (onSuccess) {
    //     debugPrint('Camera position updated successfully');
    //     // UI đã được update thông qua UpdateDragItemPositionEvent
    //     // Không cần emit state mới ở đây
    //   },
    // );
  }

  // Xóa camera khỏi emap (gọi API + xóa UI)
  FutureOr<void> _onRemoveCameraEmap(RemoveCameraEmapEvent event, Emitter<EmapState> emit) async {
    //   if (state is! EmapSuccessState) return;
    //   final currentState = state as EmapSuccessState;

    //   // Xóa item khỏi UI ngay lập tức
    //   final updatedItems = currentState.dragItems?.where((item) => item.id != event.itemId).toList();

    //   emit(currentState.copyWith(dragItems: updatedItems));

    //   // Gọi API để xóa khỏi server
    //   final res = await emapRepository.deleteCameraEmapInfo(
    //     emapId: event.emapId,
    //     cameraEmapInfoId: event.cameraEmapInfoId,
    //   );

    //   res.fold(
    //     (onFailure) {
    //       debugPrint('Delete camera from emap failed: $onFailure');
    //       // TODO: Có thể rollback UI nếu API thất bại
    //     },
    //     (onSuccess) {
    //       debugPrint('Camera deleted from emap successfully');
    //     },
    //   );
  }
}
