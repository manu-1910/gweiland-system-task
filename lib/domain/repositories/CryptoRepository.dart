import 'package:dartz/dartz.dart';
import 'package:gweiland_exchange/domain/entities/CryptoListing.dart';

import '../../data/Failure.dart';
import '../entities/CryptoInfo.dart';

abstract class CryptoRepository {
  Future<Either<List<CryptoListing>, Failure>> getLatestListing();
  Future<Either<CryptoInfo, Failure>> getCryptoInfo(int id);
}
