import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'itementry_event.dart';
part 'itementry_state.dart';

class ItementryBloc extends Bloc<ItementryEvent, ItementryState> {
  ItementryBloc() : super(ItementryInitial());

  @override
  Stream<ItementryState> mapEventToState(
    ItementryEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
