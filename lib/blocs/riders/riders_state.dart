part of 'riders_bloc.dart';

abstract class RidersState extends Equatable {
  const RidersState();

  @override
  List<Object> get props => [];
}

class RidersInitial extends RidersState {}

class RidersLoadingState extends RidersState {}

class RidersLoadedState extends RidersState {
  final RidersModel ridersModel;
  RidersLoadedState({required this.ridersModel});
}

class RidersEmptyState extends RidersState {}

class RidersErrorState extends RidersState {}
