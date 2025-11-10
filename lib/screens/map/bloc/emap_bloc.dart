import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
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
    on<GetListEmapEvent>(_onGetListEmap);
    on<ChangeEmapEvent>(_onChangeSelectEmap);
    on<RemoveEmapEvent>(_onRemoveEmap);
    on<AddCameraEmapEvent>(_addCameraEmapInfo);
    on<GetAllListCameraEvent>(_onGetListCamera);
    on<AddEmapEvent>(_onAddEmap);
    on<AddDragItemEvent>(_onAddDragItem);
    on<UpdateDragItemPositionEvent>(_onUpdateDragItemPosition);
    on<RemoveDragItemEvent>(_onRemoveDragItem);
    on<ListCameraEmapInfoEvent>(_onlistCameraEmapInfo);
    on<UpdateCameraEmapPositionEvent>(_onUpdateCameraEmapPosition);
    on<RemoveCameraEmapEvent>(_onRemoveCameraEmap);
    on<EditEmapEvent>(_onEditEmap);
    on<SearchEmapEvent>(_onSearchEmap);
  }

  FutureOr<void> _onGetListEmap(
    GetListEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    emit(EmapLoadingState());
    final emaps = await emapRepository.listEmap();

    bool shouldLoadCameraInfo = false;
    emaps.fold((onFailure) {}, (onSuccess) {
      List<EmapEntity> _list = onSuccess;
      emit(
        EmapSuccessState(
          listEmap: _list,
          emapSelected: _list.isEmpty ? null : _list.first,
        ),
      );

      // Đánh dấu cần load camera info nếu có điều kiện
      if (_list.isNotEmpty && listCamera.isNotEmpty) {
        shouldLoadCameraInfo = true;
        debugPrint(
          'ListCamera already loaded, will load camera emap info for map: ${_list.first.emapName}',
        );
      }
    });

    // Gọi _onlistCameraEmapInfo bên ngoài fold để tránh lỗi emit after completion
    if (shouldLoadCameraInfo) {
      await _onlistCameraEmapInfo(ListCameraEmapInfoEvent(), emit);
    }
  }

  Future<void> _onSearchEmap(
    SearchEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    if ((state is EmapSuccessState) == false) {
      await _onGetListEmap(GetListEmapEvent(), emit);
      return;
    }
    final currentState = state as EmapSuccessState;
    final emaps = await emapRepository.listEmap();
    emaps.fold((onFailure) {}, (onSuccess) {
      final SearchEmapInput input = SearchEmapInput(
        keyword: event.keyword,
        listEmapOrigin: onSuccess,
      );
      final SearchEmapOutput output = searchEmapUseCase.execute(input);
      emit(
        currentState.copyWith(
          listEmap: output.listEmapResult,
          emapSelected: output.listEmapResult?.firstOrNull,
          isSearching: true,
        ),
      );
    });
  }

  FutureOr<void> _onChangeSelectEmap(
    ChangeEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    if ((state is EmapSuccessState) == false) {
      await _onGetListEmap(GetListEmapEvent(), emit);
      return;
    }
    final currentState = state as EmapSuccessState;
    if (currentState.emapSelected != event.emap) {
      // Emit state mới với emap đã chọn và clear dragItems
      emit(currentState.copyWith(emapSelected: event.emap, dragItems: []));

      // Load danh sách camera của emap mới
      await _onlistCameraEmapInfo(ListCameraEmapInfoEvent(), emit);
    }
  }

  FutureOr<void> _onAddEmap(AddEmapEvent event, Emitter<EmapState> emit) async {
    if ((state is EmapSuccessState) == false) {
      await _onGetListEmap(GetListEmapEvent(), emit);
      return;
    }
    final currentState = state as EmapSuccessState;
    List<EmapEntity> emaps = List<EmapEntity>.of(currentState.listEmap ?? []);
    emit(EmapLoadingState());
    final res = await emapRepository.postEmap(
      emapName: event.emapName,
      imageBytes: event.imageBytes,
      imagePath: event.imagePath,
    );
    res.fold((onFailure) {}, (onSuccess) {
      emaps.add(onSuccess);
      emit(AddEmapSuccessState());
      emit(currentState.copyWith(listEmap: emaps, emapSelected: onSuccess));
    });
  }

  FutureOr<void> _onEditEmap(
    EditEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    if ((state is EmapSuccessState) == false) {
      await _onGetListEmap(GetListEmapEvent(), emit);
      return;
    }
    final currentState = state as EmapSuccessState;
    List<EmapEntity> emaps = List<EmapEntity>.of(currentState.listEmap ?? []);
    emit(EmapLoadingState());
    final res = await emapRepository.postEmap(
      emapId: event.emapId,
      emapName: event.emapName,
      imageBytes: event.imageBytes,
      imagePath: event.imagePath,
    );
    res.fold((onFailure) {}, (onSuccess) {
      emaps = emaps
          .map((e) => listEquals(e.emapId, event.emapId) ? onSuccess : e)
          .toList();
      emit(EditEmapSuccessState());
      emit(currentState.copyWith(listEmap: emaps, emapSelected: onSuccess));
    });
  }

  FutureOr<void> _onRemoveEmap(
    RemoveEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    final res = await emapRepository.removeEmap(emapId: event.emapId ?? []);
    res.fold((onFailure) {}, (onSuccess) {
      if (state is! EmapSuccessState) {
        return;
      }
      final currentState = state as EmapSuccessState;
      final _listEmap = currentState.listEmap;
      _listEmap?.removeWhere(
        (element) => listEquals(element.emapId, event.emapId),
      );
      emit(RemoveEmapSucessSate());
      emit(
        currentState.copyWith(
          listEmap: _listEmap,
          emapSelected: _listEmap?.first,
        ),
      );
    });
  }

  FutureOr<void> _addCameraEmapInfo(
    AddCameraEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    if (state is! EmapSuccessState) return;
    final currentState = state as EmapSuccessState;

    final res = await emapRepository.addCameraEmapInfo(
      emapId: event.emapId,
      cameraEmapinfo: event.cameraEmapInfoEntity,
    );

    res.fold(
      (onFailure) {
        debugPrint('Add camera to emap failed: $onFailure');
      },
      (onSuccess) {
        // Kiểm tra emit.isDone trước khi emit
        if (emit.isDone) return;

        // Tìm camera trong danh sách
        final cameraList = listCamera.where(
          (element) => listEquals(element.id, onSuccess.cameraId),
        );
        final camera = (cameraList.isNotEmpty) ? cameraList.first : null;

        // Tạo DragItemModel từ response
        final newDragItem = DragItemModel(
          id: onSuccess.cameraId.toString(),
          position: Offset(
            onSuccess.xCoordinate.toDouble(),
            onSuccess.yCoordinate.toDouble(),
          ),
          label: camera?.name ?? 'Camera ${onSuccess.cameraId}',
          cameraId: onSuccess.cameraId.toString(),
          cameraEmapInfoId:
              onSuccess.cameraEmapInfoId, // Lưu ID để update sau này
          source: camera?.subStreamUri.toString() ?? "",
        );

        // Thêm vào danh sách dragItems hiện tại
        final updatedDragItems = List<DragItemModel>.from(
          currentState.dragItems ?? [],
        )..add(newDragItem);

        // Emit EmapSuccessState với dragItems đã cập nhật
        emit(currentState.copyWith(dragItems: updatedDragItems));
      },
    );
  }

  FutureOr<void> _onGetListCamera(
    GetAllListCameraEvent event,
    Emitter<EmapState> emit,
  ) async {
    final groups = await emapRepository.getAllCamera();
    final currentState = state as EmapSuccessState;

    bool shouldLoadCameraInfo = false;
    groups.fold(
      (onFailure) {
        listCamera = [];
      },
      (onSuccess) {
        listCamera = onSuccess;
        emit(currentState.copyWith(listCamera: listCamera));
        debugPrint('_onGetListCamera Camera count: ${listCamera.length}');

        // Đánh dấu cần load camera info nếu có điều kiện
        if (currentState.emapSelected != null &&
            currentState.emapSelected!.emapId != null &&
            currentState.emapSelected!.emapId!.isNotEmpty) {
          shouldLoadCameraInfo = true;
          debugPrint(
            'Will load camera emap info for map: ${currentState.emapSelected!.emapName}',
          );
        }
      },
    );

    // Gọi _onlistCameraEmapInfo bên ngoài fold để tránh lỗi emit after completion
    if (shouldLoadCameraInfo) {
      await _onlistCameraEmapInfo(ListCameraEmapInfoEvent(), emit);
    }
  }

  // Handler thêm item mới
  FutureOr<void> _onAddDragItem(
    AddDragItemEvent event,
    Emitter<EmapState> emit,
  ) {
    final currentState = state as EmapSuccessState;
    final updatedItems = List<DragItemModel>.from(currentState.dragItems ?? [])
      ..add(event.item);

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
  FutureOr<void> _onRemoveDragItem(
    RemoveDragItemEvent event,
    Emitter<EmapState> emit,
  ) {
    final currentState = state as EmapSuccessState;
    final updatedItems = currentState.dragItems
        ?.where((item) => item.id != event.itemId)
        .toList();

    emit(currentState.copyWith(dragItems: updatedItems));
  }

  FutureOr<void> _onlistCameraEmapInfo(
    ListCameraEmapInfoEvent event,
    Emitter<EmapState> emit,
  ) async {
    if (state is! EmapSuccessState) return;

    final currentState = state as EmapSuccessState;
    final res = await emapRepository.listCameraEmapInfo(
      emapId: currentState.emapSelected?.emapId ?? [],
    );

    res.fold(
      (onFailure) {
        debugPrint('Load camera emap info failed: $onFailure');
      },
      (onSuccess) {
        // Kiểm tra emit.isDone trước khi emit để tránh lỗi
        if (emit.isDone) return;

        List<DragItemModel> dragItems = onSuccess.map((e) {
          // Tìm camera trong danh sách, nếu không có thì trả về null
          final cameraList = currentState.listCamera?.where(
            (element) => listEquals(element.id, e.cameraId),
          );
          final camera = (cameraList != null && cameraList.isNotEmpty)
              ? cameraList.first
              : null;

          return DragItemModel(
            id: e.cameraId.toString(),
            position: Offset(
              e.xCoordinate.toDouble(),
              e.yCoordinate.toDouble(),
            ),
            label: camera?.name ?? 'Camera ${e.cameraId}',
            cameraId: e.cameraId.toString(),
            cameraEmapInfoId: e.cameraEmapInfoId, // Lưu ID để update sau này
            source: camera?.subStreamUri.toString() ?? "",
          );
        }).toList();

        emit(currentState.copyWith(dragItems: dragItems));
      },
    );
  }

  // Update vị trí camera trên emap
  FutureOr<void> _onUpdateCameraEmapPosition(
    UpdateCameraEmapPositionEvent event,
    Emitter<EmapState> emit,
  ) async {
    if (state is! EmapSuccessState) return;

    // Gọi API addCameraEmapInfo với cameraEmapInfoId đã có để update
    final res = await emapRepository.addCameraEmapInfo(
      emapId: event.emapId,
      cameraEmapinfo: CameraEmapInfoEntity(
        cameraId: event.cameraId,
        typeIcon: event.typeIcon,
        xCoordinate: event.newPosition.dx.toInt(),
        yCoordinate: event.newPosition.dy.toInt(),
        cameraEmapInfoId:
            event.cameraEmapInfoId, // ID đã có -> server sẽ update
      ),
    );

    res.fold(
      (onFailure) {
        debugPrint('Update camera emap position failed: $onFailure');
      },
      (onSuccess) {
        debugPrint('Camera position updated successfully');
        // UI đã được update thông qua UpdateDragItemPositionEvent
        // Không cần emit state mới ở đây
      },
    );
  }

  // Xóa camera khỏi emap (gọi API + xóa UI)
  FutureOr<void> _onRemoveCameraEmap(
    RemoveCameraEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    if (state is! EmapSuccessState) return;
    final currentState = state as EmapSuccessState;

    // Xóa item khỏi UI ngay lập tức
    final updatedItems = currentState.dragItems
        ?.where((item) => item.id != event.itemId)
        .toList();

    emit(currentState.copyWith(dragItems: updatedItems));

    // Gọi API để xóa khỏi server
    final res = await emapRepository.deleteCameraEmapInfo(
      emapId: event.emapId,
      cameraEmapInfoId: event.cameraEmapInfoId,
    );

    res.fold(
      (onFailure) {
        debugPrint('Delete camera from emap failed: $onFailure');
        // TODO: Có thể rollback UI nếu API thất bại
      },
      (onSuccess) {
        debugPrint('Camera deleted from emap successfully');
      },
    );
  }
}
