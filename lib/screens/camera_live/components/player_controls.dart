import 'package:flutter/material.dart';

import '../../monitor/widgets/camera_player.dart';

class PlayerControls extends StatelessWidget {
  final GlobalKey<CameraPlayerState> ref;

  const PlayerControls({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Spacer(),

        IconButton(
          color: Colors.white,
          icon: Icon(Icons.play_arrow),
          onPressed: () {
            ref.currentState!.controller.play();
          },
        ),
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.pause),
          onPressed: () {
            ref.currentState!.controller.pause();
          },
        ),

        IconButton(
          color: Colors.white,
          icon: Icon(Icons.replay_30),
          onPressed: () {
            //
          },
        ),
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.forward_30),
          onPressed: () {
            //
          },
        ),

        Spacer(),
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.settings),
          onPressed: () async {
            //
          },
        ),
      ],
    );
  }
}
