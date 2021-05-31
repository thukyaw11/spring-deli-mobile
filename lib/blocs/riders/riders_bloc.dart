import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spring_deli_app/models/rider/riders_model.dart';
import 'package:spring_deli_app/services/api/api_service.dart';

part 'riders_event.dart';
part 'riders_state.dart';

class RidersBloc extends Bloc<RidersEvent, RidersState> {
  RidersBloc({required this.api}) : super(RidersInitial());

  final ApiService api;

  @override
  Stream<RidersState> mapEventToState(
    RidersEvent event,
  ) async* {
    if (event is FetchRiderEvent) {
      yield RidersLoadingState();
      try {
        final response = await api.getRidersList(event.statePath);
        print(event.statePath);
        yield RidersLoadedState(ridersModel: response);
      } on Exception {
        yield RidersErrorState();
      } on SocketException {
        yield RidersErrorState();
      }
    }
  }
}
