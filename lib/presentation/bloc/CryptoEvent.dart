import 'package:equatable/equatable.dart';

import '../../domain/entities/CryptoListing.dart';

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

class CryptoListFetched extends CryptoEvent {
  const CryptoListFetched(this.listing);
  final List<CryptoListing> listing;
  @override
  List<Object?> get props => [listing];
}
