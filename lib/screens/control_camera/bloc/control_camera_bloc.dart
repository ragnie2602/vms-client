import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/share/invite_message_entity.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_control_camera_repository.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_camera_input.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_camera_output.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_camera_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_no_group/filter_camera_no_group_input.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_no_group/filter_camera_no_group_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_tag_camera_input.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_tag_camera_output.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_tag_camera_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/delete_camera/delete_camera_input.dart';
import 'package:vms_flutter_client/domain/usecases/delete_camera/delete_camera_use_case.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_event.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';

class ControlCameraBloc extends BaseBloc<ControlCameraEvent, ControlCameraState> {
  final IControlCameraRepository controlGroupRepository;
  final FilterCameraUseCase filterCameraUseCase;
  final FilterCameraNoGroupUseCase filterCameraNoGroupUseCase;
  final FilterTagCameraUseCase filterTagCameraUseCase;

  final DeleteCameraUseCase deleteCameraUseCase;
  ControlCameraBloc({
    required this.controlGroupRepository,
    required this.filterCameraUseCase,
    required this.filterCameraNoGroupUseCase,
    required this.filterTagCameraUseCase,
    required this.deleteCameraUseCase,
  }) : super(const ControlCameraState()) {
    on<ValidateCameraEvent>(_onValidateCamera);
    on<GetListCameraEvent>(_onGetListCamera);
    on<GetListCameraNoGroupEvent>(_onGetListCameraNoGroup);
    on<GetListCameraInGroupEvent>(_onGetCameraInGroup);
    on<CheckOnvifEvent>(_onCheckOnvif);
    on<FilterCameraEvent>(_onFilterCamera);
    on<FilterTagCameraEvent>(_onFilterTagCamera);
    on<AddCameraRTSPEvent>(_onAddCameraRTSP);
    on<AddCameraOnvifEvent>(_onAddCameraOnvif);
    on<UpdateCameraEvent>(_onUpdateCamera);
    on<DeleteCameraEvent>(_onDeleteCamera);
    // on<ShareCameraEvent>(_onShareCamera);
    on<CheckAccountShareEvent>(_onCheckAccountShare);
    on<AddCameraToGroupEvent>(_onAddCameraToGroup);
    // on<ListShareInviteGroupEvent>(_onListShareInviteGroup);
    // on<ListShareCameraEvent>(_onListShareCamera);
    // on<DeleteShareCameraEvent>(_onDeleteShareCamera);
    on<RemoveCameraFromGroupEvent>(_onRemoveCameraFromGroup);

    on<GetAllTagsEvent>(_onGetAllTags);
    on<CreateTagEvent>(_onCreateTag);
    on<DeleteTagEvent>(_onDeleteTag);
    on<UpdateTagEvent>(_onUpdateTag);
  }

  // list camera
  List<CameraEntity> listCamera = [];
  List<int> currentGroupId = [];
  bool isNoGroup = false;

  //list tag
  List<TagEntity> listTag = [];

  FutureOr<void> _onGetListCamera(
    GetListCameraEvent event,
    Emitter<ControlCameraState> emit,
  ) async {
    currentGroupId.clear();
    isNoGroup = false;
    final groups = await controlGroupRepository.getAllCamera();
    groups.fold(
      (onFailure) {
        listCamera = [];
        emit(ListCameraFailState(groups.left.toString()));
      },
      (onSuccess) {
        listCamera = onSuccess;
        emit(ListCameraSuccessState(cameras: listCamera));
      },
    );
  }

  // get lại danh sách tất cả camera => dựa vào groupOwnerId để filter ra camera chưa có nhóm
  FutureOr<void> _onGetListCameraNoGroup(
    GetListCameraNoGroupEvent event,
    Emitter<ControlCameraState> emit,
  ) async {
    currentGroupId.clear();
    isNoGroup = true;
    final groups = await controlGroupRepository.getAllCamera();
    groups.fold(
      (onFailure) {
        listCamera = [];
        emit(ListCameraFailState(groups.left.toString()));
      },
      (onSuccess) {
        // filter camera no group
        final input = FilterCameraNoGroupInput(listCameraOrigin: onSuccess);
        final output = filterCameraNoGroupUseCase.execute(input);
        listCamera = output.listCamera ?? [];
        emit(ListCameraSuccessState(cameras: listCamera));
      },
    );
  }

  FutureOr<void> _onGetCameraInGroup(
    GetListCameraInGroupEvent event,
    Emitter<ControlCameraState> emit,
  ) async {
    currentGroupId.clear();
    currentGroupId.addAll(event.groupId ?? []);
    isNoGroup = false;
    final groups = await controlGroupRepository.getCamerasInGroup(groupId: event.groupId);
    groups.fold(
      (onFailure) {
        listCamera = [];
        emit(ListCameraFailState(groups.left.toString()));
      },
      (onSuccess) {
        listCamera = onSuccess;
        emit(ListCameraSuccessState(cameras: listCamera));
      },
    );
  }

  FutureOr<void> _onValidateCamera(
    ValidateCameraEvent event,
    Emitter<ControlCameraState> emit,
  ) async {
    emit(ControlCameraState());
    final validateCamera = await controlGroupRepository.validateCamera(message: event.message);
    validateCamera.fold((onFailure) => emit(ValidateCameraState(validateCamera.left.toString())), (
      onSuccess,
    ) {
      emit(ValidateCameraState(validateCamera.left.toString()));
    });
  }

  FutureOr<void> _onCheckOnvif(CheckOnvifEvent event, Emitter<ControlCameraState> emit) async {
    // Reset state trước khi check để đảm bảo listener luôn được trigger
    emit(const ControlCameraState());

    final checkOnvif = await controlGroupRepository.checkCameraOnvif(
      xaddrs: event.xaddrs,
      userName: event.userName,
      password: event.password,
      boxId: event.boxId,
    );
    checkOnvif.fold(
      (onFailure) => emit(CheckOnvifFailState(checkOnvif.left.toString())),
      (onSuccess) => emit(CheckOnvifSuccessState(cameraOnvif: onSuccess)),
    );
  }

  void _onFilterCamera(FilterCameraEvent event, Emitter<ControlCameraState> emit) {
    final FilterCameraInput input = FilterCameraInput(
      nameCamera: event.cameraName,
      isOnline: event.isOnline,
      listCameraOrigin: listCamera,
    );
    final FilterCameraOutput output = filterCameraUseCase.execute(input);
    emit(ListCameraSuccessState(cameras: output.listCamera ?? []));
  }

  FutureOr<void> _onAddCameraRTSP(
    AddCameraRTSPEvent event,
    Emitter<ControlCameraState> emit,
  ) async {
    // Reset state trước khi check để đảm bảo listener luôn được trigger
    emit(const ControlCameraState());
    final addCameraRTSP = await controlGroupRepository.addCameraRTSP(
      name: event.name,
      username: event.username,
      password: event.password,
      rtspUrl: event.rtspUrl,
      location: event.location,
      boxId: event.boxId,
      groupId: currentGroupId,
      subStreamUrls: event.subStreamUrls,
      tags: event.tags,
    );
    addCameraRTSP.fold(
      (onFailure) => emit(AddCameraFailState(addCameraRTSP.left.toString())),
      (onSuccess) => emit(AddCameraSuccessState(cameraEntity: onSuccess)),
    );
  }

  FutureOr<void> _onAddCameraOnvif(
    AddCameraOnvifEvent event,
    Emitter<ControlCameraState> emit,
  ) async {
    // Reset state trước khi check để đảm bảo listener luôn được trigger
    emit(const ControlCameraState());
    final addCameraOnvif = await controlGroupRepository.addCameraOnvif(
      name: event.name,
      username: event.username,
      password: event.password,
      onvifDeviceIp: event.onvifDeviceIp,
      rtspUrl: event.rtspUrl,
      serialNumber: event.serialNumber,
      location: event.location,
      boxId: event.boxId,
      groupId: currentGroupId,
      urn: event.urn,
      subStreamUrls: event.subStreamUrls,
      tags: event.tags,
    );
    addCameraOnvif.fold(
      (onFailure) => emit(AddCameraFailState(addCameraOnvif.left.toString())),
      (onSuccess) => emit(AddCameraSuccessState(cameraEntity: onSuccess)),
    );
  }

  FutureOr<void> _onUpdateCamera(UpdateCameraEvent event, Emitter<ControlCameraState> emit) async {
    emit(const ControlCameraState());
    final res = await controlGroupRepository.updateCamera(
      cameraId: event.cameraId,
      name: event.name,
      rtspUrl: event.rtspUrl,
      userName: event.userName,
      password: event.password,
      xaddr: event.xaddr,
      location: event.location,
      subStreamUrls: event.subStreamUrls,
      tags: event.tags,
    );
    res.fold((onFailure) => emit(AddCameraFailState(res.left.toString())), (onSuccess) {
      emit(UpdateCameraSuccessState(cameraEntity: onSuccess));
    });
  }

  FutureOr<void> _onDeleteCamera(DeleteCameraEvent event, Emitter<ControlCameraState> emit) async {
    final input = DeleteCameraInput(cameraId: event.cameraId, currentList: listCamera);
    final output = await deleteCameraUseCase.execute(input);

    if (output.isSuccess) {
      listCamera = output.listCamera;
      emit(DeleteCameraSuccessState(deletedCameraId: event.cameraId));
    } else {
      emit(
        RemoveCameraFromGroupFailState(
          output.errorMessage ?? 'Xóa camera thất bại',
          timeId: DateTime.now().microsecondsSinceEpoch,
        ),
      );
    }
  }

  // FutureOr<void> _onShareCamera(
  //   ShareCameraEvent event,
  //   Emitter<ControlCameraState> emit,
  // ) async {
  //   final res = await controlGroupRepository.shareCamera(
  //     cameraId: event.cameraId,
  //     role: event.role,
  //     accountInvite: event.accountInvite,
  //   );
  //   res.fold(
  //     (onFailure) => emit(AddCameraFailState(res.left.toString())),
  //     (onSuccess) => emit(ControlCameraState()),
  //   );
  // }

  FutureOr<void> _onCheckAccountShare(
    CheckAccountShareEvent event,
    Emitter<ControlCameraState> emit,
  ) async {
    final res = await controlGroupRepository.checkAccountShare(
      cameraId: event.cameraId,
      account: event.account,
      shareType: event.shareType,
      groupId: event.groupId,
    );
    res.fold(
      (onFailure) => emit(AddCameraFailState(res.left.toString())),
      (onSuccess) => emit(ControlCameraState()),
    );
  }

  FutureOr<void> _onAddCameraToGroup(
    AddCameraToGroupEvent event,
    Emitter<ControlCameraState> emit,
  ) async {
    emit(ControlCameraLoadingState());
    final res = await controlGroupRepository.addCameraToGroup(
      cameraIds: event.cameraIds,
      groupId: event.groupId,
    );
    res.fold((onFailure) => emit(AddCameraFailState(res.left.toString())), (onSuccess) {
      listCamera = List<CameraEntity>.from(listCamera)..addAll(onSuccess);
      emit(ListCameraSuccessState(cameras: List<CameraEntity>.from(listCamera)));
    });
  }

  Future<List<InviteMessageEntity>> getListShareCamera({List<int>? camId}) async {
    final res = await controlGroupRepository.listShareCamera(cameraId: camId ?? []);
    return res.fold((onFailure) => <InviteMessageEntity>[], (onSuccess) => onSuccess);
  }

  Future<List<int>> shareCamera({List<int>? camId, int? role, String? accountInvite}) async {
    final res = await controlGroupRepository.shareCamera(
      cameraId: camId ?? [],
      role: role ?? 1,
      accountInvite: accountInvite ?? '',
    );
    return res.fold((onFailure) => <int>[], (onSuccess) => onSuccess);
  }

  Future<List<int>> deleteShareCamera({
    List<int>? camId,
    String? accountB,
    List<int>? shareId,
    Function({String? messageFail})? onToastFail,
  }) async {
    final res = await controlGroupRepository.deleteShareCamera(
      cameraId: camId ?? [],
      accountB: accountB ?? '',
      shareId: shareId ?? [],
    );
    return res.fold((onFailure) {
      if (onToastFail != null) {
        onToastFail(messageFail: onFailure.toString()).call();
      }
      return <int>[];
    }, (onSuccess) => onSuccess);
  }

  FutureOr<void> _onRemoveCameraFromGroup(
    RemoveCameraFromGroupEvent event,
    Emitter<ControlCameraState> emit,
  ) async {
    emit(ControlCameraLoadingState());
    final res = await controlGroupRepository.removeCameraFromGroup(
      cameraId: event.cameraId,
      groupId: event.groupId ?? currentGroupId,
    );
    res.fold(
      (onFailure) => emit(
        RemoveCameraFromGroupFailState(
          res.left.toString(),
          timeId: DateTime.now().microsecondsSinceEpoch,
        ),
      ),
      (onSuccess) {
        // Cập nhật lại danh sách camera sau khi xóa khỏi nhóm.
        final updated = List<CameraEntity>.from(listCamera)
          ..removeWhere((camera) => listEquals(event.cameraId, camera.id));
        // check nếu đang ở node của 1 group bất kì hoặc ở node 'chưa gán nhóm' -> update lại list = cách remove
        // nếu đang ở node 'Tất cả' thì giữ nguyên list
        if (currentGroupId.isNotEmpty || isNoGroup == true) {
          listCamera = updated;
        }
        // emit state succes
        emit(RemoveCameraFromGroupSuccessState(listCamera));
        emit(ListCameraSuccessState(cameras: List<CameraEntity>.from(listCamera)));
      },
    );
  }

  FutureOr<void> _onGetAllTags(GetAllTagsEvent event, Emitter<ControlCameraState> emit) async {
    emit(GetAllTagsLoadingState());

    final res = await controlGroupRepository.getAllTag();
    res.fold(
      (onFailure) {
        listTag = [];
        emit(GetAllTagsFailState(res.left.toString()));
      },
      (onSuccess) {
        listTag = onSuccess;
        emit(GetAllTagsSuccessState(tags: onSuccess));
      },
    );
  }
    void _onFilterTagCamera(
    FilterTagCameraEvent event,
    Emitter<ControlCameraState> emit,
  ) {
    final FilterTagCameraInput input = FilterTagCameraInput(
      tagName: event.tagName,
      keyWord: event.keyWord,
      listCameraOrigin: listCamera,
    );
    final FilterTagCameraOutput output = filterTagCameraUseCase.execute(input);
    emit(ListCameraSuccessState(cameras: output.listCamera ?? []));
  }

  FutureOr<void> _onCreateTag(CreateTagEvent event, Emitter<ControlCameraState> emit) async {
    emit(CreateTagLoadingState());
    final res = await controlGroupRepository.createTag(tag: event.tag);
    res.fold(
      (onFailure) => emit(CreateTagFailState(res.left.toString())),
      (onSuccess) => emit(CreateTagSuccessState(tag: onSuccess)),
    );
  }

  FutureOr<void> _onDeleteTag(DeleteTagEvent event, Emitter<ControlCameraState> emit) async {
    emit(DeleteTagLoadingState(event.id));
    final res = await controlGroupRepository.deleteTag(id: event.id);
    res.fold(
      (onFailure) => emit(DeleteTagFailState(res.left.toString())),
      (onSuccess) => emit(DeleteTagSuccessState(event.id)),
    );
  }

  FutureOr<void> _onUpdateTag(UpdateTagEvent event, Emitter<ControlCameraState> emit) async {
    emit(UpdateTagLoadingState(event.tag.id));
    final res = await controlGroupRepository.updateTag(tag: event.tag);
    res.fold(
      (onFailure) => emit(UpdateTagFailState(res.left.toString())),
      (onSuccess) => emit(UpdateTagSuccessState(tag: onSuccess)),
    );
  }
}
