import 'package:flutter/foundation.dart';

class EmapInforEntity {
  final List<int>? emapId;
  final String? emapName;
  final String? backgroundPath;
  EmapInforEntity({this.emapId, this.emapName, this.backgroundPath});
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EmapInforEntity &&
            runtimeType == other.runtimeType &&
            listEquals(emapId, other.emapId) &&
            emapName == other.emapName &&
            backgroundPath == other.backgroundPath);
  }

  @override
  int get hashCode => Object.hash(emapId, emapName, backgroundPath);
}
