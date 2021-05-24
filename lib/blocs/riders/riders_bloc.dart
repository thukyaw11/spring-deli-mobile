import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'riders_event.dart';
part 'riders_state.dart';

class RidersBloc extends Bloc<RidersEvent, RidersState> {
  RidersBloc() : super(RidersInitial());

  @override
  Stream<RidersState> mapEventToState(
    RidersEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
