import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseView<T extends BlocBase> extends StatelessWidget {
  const BaseView({super.key});

  T bloc(BuildContext context) => BlocProvider.of<T>(context);

  Widget buildView(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return buildView(context);
  }
}