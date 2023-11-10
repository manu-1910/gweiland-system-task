import 'package:dartz/dartz.dart';
import 'package:gweiland_exchange/data/Failure.dart';
import 'package:gweiland_exchange/domain/entities/CryptoInfo.dart';
import 'package:gweiland_exchange/domain/repositories/CryptoRepository.dart';

class GetCryptoInfoUsecase {
  final CryptoRepository repository;
  GetCryptoInfoUsecase(this.repository);
  Future<Either<CryptoInfo, Failure>> execute(int cryptoId) {
    return repository.getCryptoInfo(cryptoId);
  }
}
