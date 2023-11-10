import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:gweiland_exchange/data/Failure.dart';
import 'package:gweiland_exchange/data/ServerException.dart';
import 'package:gweiland_exchange/data/datasources/RemoteDataSource.dart';
import 'package:gweiland_exchange/domain/entities/CryptoListing.dart';
import 'package:gweiland_exchange/domain/repositories/CryptoRepository.dart';

class CryptoListingRepositoryImpl implements CryptoRepository {
  final RemoteDataSource dataSource;

  CryptoListingRepositoryImpl(this.dataSource);

  @override
  Future<Either<List<CryptoListing>, Failure>> getLatestListing() async {
    try {
      final result = await dataSource.getLatestListing();
      return Left(List<CryptoListing>.from(result.map((e) => e.toEntity())));
    } on ServerException {
      return const Right(ServerFailure("Fetch failed!!"));
    } on SocketException {
      return const Right(ConnectionFailure("Internet connection issue!!"));
    }
  }
}
