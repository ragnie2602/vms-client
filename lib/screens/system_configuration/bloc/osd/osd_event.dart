part of 'osd_bloc.dart';

class OsdEvent extends Equatable {
  const OsdEvent();

  @override
  List<Object?> get props => [];
}

class ChangeOSDPosition extends OsdEvent {
  final OSDPosition position;

  const ChangeOSDPosition(this.position);

  @override
  List<Object?> get props => [position];
}

class NotifyOSDPosition extends OsdEvent {
  final OSDPosition position;

  const NotifyOSDPosition(this.position);

  @override
  List<Object?> get props => [position];
}
