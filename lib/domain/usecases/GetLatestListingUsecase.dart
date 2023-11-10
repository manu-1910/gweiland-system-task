import 'package:gweiland_exchange/domain/entities/CryptoListing.dart';

import '../repositories/CryptoRepository.dart';

class GetLatestListingUsecase {
  final CryptoRepository repository;

  GetLatestListingUsecase(this.repository);

  Future<CryptoListing?> execute() {
    return repository.getLatestListing();
  }
}
