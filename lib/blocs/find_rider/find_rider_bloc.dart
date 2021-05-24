import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'find_rider_event.dart';
part 'find_rider_state.dart';

class FindRiderBloc extends Bloc<FindRiderEvent, FindRiderState> {
  FindRiderBloc() : super(FindRiderInitial());

  @override
  Stream<FindRiderState> mapEventToState(
    FindRiderEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
