import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/data/models/packet.dart';

import '../proto/models/comm.command2.pb.dart';
import '../proto/models/comm.model.pb.dart';
import 'socket_api_client.dart';

class CustomLiveViewService {
  final SocketApiClient socketClient;

  const CustomLiveViewService(this.socketClient);

  Future<List<CustomLiveView>> getListCustomLiveView() async {
    final response = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: [],
          type: PacketType.getListCustomLiveView,
        ),
      ),
    );

    return response.fold(
      (failure) => throw failure.toMessageFailure(),
      (buffer) => GetListCustomLiveView_Reply.fromBuffer(buffer).customs,
    );
  }

  Future<CustomLiveView> addCustomLiveView({
    required String name,
    required int baseViewCode,
  }) async {
    final request = AddCustomLiveView_Request(
      name: name,
      baseView: Base_View.valueOf(baseViewCode),
    );

    final response = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: request.writeToBuffer(),
          type: PacketType.addCustomLiveView,
        ),
      ),
    );

    return response.fold(
      (failure) => throw failure.toMessageFailure(AddCustomLiveView_Error.valueOf),
      (buffer) => AddCustomLiveView_Reply.fromBuffer(buffer).customs,
    );
  }

  Future<List<int>> deleteCustomLiveView(List<int> id) async {
    final response = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: DeleteCustomLiveView_Request(customsId: id).writeToBuffer(),
          type: PacketType.deleteCustomLiveView,
        ),
      ),
    );

    return response.fold(
      (failure) => throw failure.toMessageFailure(DeleteCustomLiveView_Error.valueOf),
      (buffer) => DeleteCustomLiveView_Reply.fromBuffer(buffer).customsId,
    );
  }

  Future<CustomLiveView> updateCustomLiveView(CustomLiveView newValue) async {
    final response = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: newValue.writeToBuffer(),
          type: PacketType.updateCustomLiveView,
        ),
      ),
    );

    return response.fold(
      (failure) => throw failure.toMessageFailure(UpdateCustomLiveView_Error.valueOf),
      (buffer) => UpdateCustomLiveView_Reply.fromBuffer(buffer).customs,
    );
  }
}
