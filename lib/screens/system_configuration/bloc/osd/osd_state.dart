part of 'osd_bloc.dart';

class OsdState extends Equatable {
  final OSDPosition position;

  const OsdState(this.position);

  @override
  List<Object?> get props => [position];
}
