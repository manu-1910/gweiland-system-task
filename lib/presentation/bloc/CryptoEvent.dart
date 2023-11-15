import 'package:equatable/equatable.dart';

abstract class CryptoEvent extends Equatable {
  const CryptoEvent();
  @override
  List<Object?> get props => [];
}

class FetchNextCryptosList extends CryptoEvent {
  const FetchNextCryptosList();
  @override
  List<Object?> get props => [];
}
