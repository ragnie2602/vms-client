import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/screens/ai_box/ai_box_view.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_bloc.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_event.dart';

class AiBoxScreen extends StatefulWidget {
  const AiBoxScreen({super.key});

  @override
  State<AiBoxScreen> createState() => _AiBoxScreenState();
}

class _AiBoxScreenState extends State<AiBoxScreen> {
  late AiBoxBloc _aiBoxBloc;
  final TextEditingController searchController = TextEditingController();
  final ScrollController _listAiBoxController = ScrollController();

  @override
  void initState() {
    super.initState();
    _aiBoxBloc = context.read<AiBoxBloc>();
    _aiBoxBloc.add(GetListAiBoxEvent());
  }

  @override
  void dispose() {
    searchController.dispose();
    _listAiBoxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AiBoxView(
      bloc: _aiBoxBloc,
      searchController: searchController,
      listController: _listAiBoxController,
    );
  }
}
