part of 'riders_bloc.dart';

abstract class RidersEvent extends Equatable {
  const RidersEvent();

  @override
  List<Object> get props => [];
}

class FetchRiderEvent extends RidersEvent {
  final String statePath;
  FetchRiderEvent({required this.statePath});
}
