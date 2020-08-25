import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:pharmacy/models/models.dart';

part 'expiryitem_event.dart';
part 'expiryitem_state.dart';

class ExpiryitemBloc extends Bloc<ExpiryitemEvent, ExpiryitemState> {
  ExpiryitemBloc() : super(ExpiryitemInitial());

  @override
  Stream<ExpiryitemState> mapEventToState(
    ExpiryitemEvent event,
  ) async* {
    if (event is FetchExpiryitemEvent) {
      List<ExpiryItem> _expiryItems;
      for (int i = 0; i < 41; i++) {
        _expiryItems.add(ExpiryItem("User_$i", i, i, '2019-01-01', 'pharma'));
      }
      yield FetchExpiryitemState(_expiryItems);
    }
  }
}
