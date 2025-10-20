import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SizeObserver extends SingleChildRenderObjectWidget {
  final void Function(Size size) onChange;

  const SizeObserver({super.key, required this.onChange, required Widget super.child});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderObject(onChange);
  }

  @override
  // ignore: library_private_types_in_public_api
  void updateRenderObject(BuildContext context, covariant _RenderObject renderObject) {
    renderObject.onChange = onChange;
  }
}

class _RenderObject extends RenderProxyBox {
  Size? oldSize;
  void Function(Size size) onChange;

  _RenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    Size newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}
