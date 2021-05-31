part of 'find_single_rider_bloc.dart';

abstract class FindSingleRiderEvent extends Equatable {
  const FindSingleRiderEvent();

  @override
  List<Object> get props => [];
}

class FindSingleRiderFetchEvent extends FindSingleRiderEvent {}
