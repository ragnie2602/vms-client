import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_bloc.dart';
import 'layout/home_desktop_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final content = BlocSelector<HomeBloc, HomeState, HomeTab>(
      selector: (state) => state.selectedTab,
      builder: (context, state) => state.content,
    );

    return Scaffold(
      body: SafeArea(child: HomeDesktopLayout(content: content)),
    );
  }
}
