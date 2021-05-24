part of 'riders_bloc.dart';

abstract class RidersState extends Equatable {
  const RidersState();
  
  @override
  List<Object> get props => [];
}

class RidersInitial extends RidersState {}
