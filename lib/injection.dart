import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gweiland_exchange/data/datasources/RemoteDataSource.dart';
import 'package:gweiland_exchange/data/repositories/CryptoListingRepositoryImpl.dart';
import 'package:gweiland_exchange/domain/repositories/CryptoRepository.dart';
import 'package:gweiland_exchange/domain/usecases/GetCryptoInfoUsecase.dart';
import 'package:gweiland_exchange/domain/usecases/GetLatestListingUsecase.dart';
import 'package:gweiland_exchange/presentation/bloc/CryptoBloc.dart';

final locator = GetIt.instance;

void init() {
  // Usecase
  locator.registerLazySingleton(() => GetCryptoInfoUsecase(locator()));

  locator.registerLazySingleton(() => GetLatestListingUsecase(locator()));

  // Bloc
  locator.registerFactory<CryptoBloc>(() => CryptoBloc(locator(), locator()));

  // Repository
  locator.registerLazySingleton<CryptoRepository>(
      () => CryptoListingRepositoryImpl(locator()));

  // Data source
  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(locator()));

  // External
  locator.registerLazySingleton(() => Dio());
}
