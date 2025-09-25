import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/camera_player.dart';

class CameraLiveScreenArgs {
  final CameraEntity data;
  final Routes? previous;
  CameraLiveScreenArgs({required this.data, this.previous});
}

class CameraLiveScreen extends StatefulWidget {
  CameraLiveScreen({super.key, required CameraLiveScreenArgs args})
    : data = args.data,
      previous = args.previous;

  final CameraEntity data;
  final Routes? previous;

  @override
  State<CameraLiveScreen> createState() => _CameraLiveScreenState();
}

class _CameraLiveScreenState extends State<CameraLiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 13),
          onPressed: widget.previous != null ? () => context.goNamed(widget.previous!.name) : null,
          label: Text("Quay lại", style: TextStyle(color: Colors.black, fontSize: 13)),
        ),

        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            child: CameraPlayer(data: widget.data, isSubStream: false),
          ),
        ),
      ],
    );
  }
}
