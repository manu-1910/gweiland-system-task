import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gweiland_exchange/domain/entities/CryptoListing.dart';
import 'package:gweiland_exchange/domain/usecases/GetCryptoInfoUsecase.dart';
import 'package:gweiland_exchange/domain/usecases/GetLatestListingUsecase.dart';
import 'package:gweiland_exchange/presentation/LoadState.dart';
import 'package:gweiland_exchange/presentation/bloc/CryptoEvent.dart';

class CryptoBloc extends Bloc<CryptoEvent, LoadState> {
  final GetCryptoInfoUsecase getCryptoInfoUsecase;
  final GetLatestListingUsecase getLatestListingUsecase;

  CryptoBloc(this.getLatestListingUsecase, this.getCryptoInfoUsecase)
      : super(EmptyState()) {
    on<FetchNextCryptosList>((event, emit) async {
      debugPrint("Fetch started!!");
      emit(LoadingState());
      final result = await getLatestListingUsecase.execute();
      List<CryptoListing> cryptos = [];
      result.fold((data) async {
        Future loop = Future.forEach<CryptoListing>(data, (item) async {
          final inforesult = await getCryptoInfoUsecase.execute(item.id);
          inforesult.fold((info) => {item.logo = info.logo},
                  (failure) => {item.logo = ""});
          cryptos.add(item);
        });
        await loop.whenComplete(() => add(CryptoListFetched(cryptos)));
      }, (failure) {
        debugPrint("Fetch failed : ${failure.message}");
        emit(LoadError(failure.message));
      });
    });

    on<CryptoListFetched>((event, emit){
      emit(LoadedData(event.listing));
    });
  }

}
