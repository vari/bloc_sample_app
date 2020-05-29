import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'led_event.dart';
import 'led_state.dart';
import '../repositories/led_repository.dart';

class LEDBloc extends Bloc<LEDEvent, LEDState> {
  final LEDRepository repository;
  LEDBloc({@required this.repository}): assert (repository != null);

  @override
  LEDState get initialState => LEDEmpty();

  @override
  Stream<LEDState> mapEventToState(LEDEvent event) async* {
    print('Received $event while state is $state');

    if (event is GetLEDData && (state is LEDEmpty || state is LEDLoadFailed)) {
      yield LEDLoading();
      try {
        final data = await repository.getData();
        yield LEDLoaded();
      } catch(e) {
        yield LEDLoadFailed(errorMsg: '$e');
      }
    }
  }
}