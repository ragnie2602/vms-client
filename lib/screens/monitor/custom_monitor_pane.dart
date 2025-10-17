import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/custom_view/custom_view_bloc.dart';
import 'package:vms_flutter_client/screens/shared/state_builder_mixin.dart';

class CustomMonitorPane extends StatelessWidget with StateBuilderMixin {
  const CustomMonitorPane({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomViewBloc, CustomViewState>(
      builder: (context, state) =>
          stateBuilder<CustomViewSuccess>(state, child: (state) => Container()),
    );
  }
}
