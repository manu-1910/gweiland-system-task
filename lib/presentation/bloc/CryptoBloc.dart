import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gweiland_exchange/domain/entities/CryptoInfo.dart';
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
      emit(LoadingState());
      final result = await getLatestListingUsecase.execute();
      List<CryptoListing> cryptos = List.empty();
      result.fold((data) {
        data.forEach((element) async {
          final inforesult = await getCryptoInfoUsecase.execute(element.id);
          inforesult.fold((info) => {element.logo = info.logo},
              (failure) => {element.logo = ""});
          cryptos.add(element);
        });
        emit(LoadedData(cryptos));
      }, (failure) {
        emit(LoadError(failure.message));
      });
    });
  }
}
