import 'package:dartz/dartz.dart';
import 'package:gweiland_exchange/domain/entities/CryptoListing.dart';

import '../../data/Failure.dart';

abstract class CryptoRepository {
  Future<Either<List<CryptoListing>, Failure>> getLatestListing();
}
