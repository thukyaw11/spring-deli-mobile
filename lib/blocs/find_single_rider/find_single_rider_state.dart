part of 'find_single_rider_bloc.dart';

abstract class FindSingleRiderState extends Equatable {
  const FindSingleRiderState();

  @override
  List<Object> get props => [];
}

class FindSingleRiderInitial extends FindSingleRiderState {}

class FindSingleRiderLoadingState extends FindSingleRiderState {}

class FindSingleRiderLoadedState extends FindSingleRiderState {}

class FindSingleRiderErrorState extends FindSingleRiderState {}

class FindSingleRiderNotFoundState extends FindSingleRiderState {}
