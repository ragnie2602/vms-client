import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';

mixin StateBuilderMixin {
  Widget buildLoading() {
    return Center(child: CircularProgressIndicator.adaptive());
  }

  Widget buildEmpty([String text = 'No Data']) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildError(String message, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red, fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget stateBuilder<T extends BaseState>(
    covariant BaseState state, {
    Widget Function()? loadingBuilder,
    Widget Function(String message)? errorBuilder,
    Widget Function()? emptyBuilder,
    VoidCallback? onReload,
    required Widget Function(T state) child,
  }) {
    if (state.type.isLoading) return loadingBuilder?.call() ?? buildLoading();
    if (state.type.isError) {
      return errorBuilder?.call(state.errorMsg) ?? buildError(state.errorMsg, onTap: onReload);
    }
    if (state.type.isSuccess && state.type.isEmpty) return emptyBuilder?.call() ?? buildEmpty();

    return child(state as T);
  }
}
