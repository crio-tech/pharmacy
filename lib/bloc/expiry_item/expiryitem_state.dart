part of 'expiryitem_bloc.dart';

@immutable
abstract class ExpiryitemState {}

class ExpiryitemInitial extends ExpiryitemState {}

class FetchExpiryitemState extends ExpiryitemState {
  final List<ExpiryItem> expiryItems;

  FetchExpiryitemState(this.expiryItems);
}
