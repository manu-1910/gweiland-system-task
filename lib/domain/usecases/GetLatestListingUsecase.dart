import 'package:dartz/dartz.dart';
import 'package:gweiland_exchange/data/Failure.dart';
import 'package:gweiland_exchange/domain/entities/CryptoListing.dart';

import '../repositories/CryptoRepository.dart';

class GetLatestListingUsecase {
  final CryptoRepository repository;

  GetLatestListingUsecase(this.repository);

  Future<Either<CryptoListing, Failure>> execute() {
    return repository.getLatestListing();
  }
}
