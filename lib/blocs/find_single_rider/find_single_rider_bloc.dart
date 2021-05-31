import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'find_single_rider_event.dart';
part 'find_single_rider_state.dart';

class FindSingleRiderBloc
    extends Bloc<FindSingleRiderEvent, FindSingleRiderState> {
  FindSingleRiderBloc() : super(FindSingleRiderInitial());

  @override
  Stream<FindSingleRiderState> mapEventToState(
    FindSingleRiderEvent event,
  ) async* {
    if (event is FindSingleRiderFetchEvent) {
      print("finding rider");
    }
  }
}
