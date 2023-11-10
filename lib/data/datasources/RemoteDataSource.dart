import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gweiland_exchange/data/ServerException.dart';
import 'package:gweiland_exchange/data/config.dart';
import 'package:gweiland_exchange/data/models/CryptoInfoModel.dart';
import 'package:gweiland_exchange/data/models/CryptoListingModel.dart';

abstract class RemoteDataSource {
  Future<List<CryptoListingModel>> getLatestListing();
  Future<CryptoInfoModel> getLogoOfCurrencyWithId(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dioClient;
  RemoteDataSourceImpl({required this.dioClient});

  @override
  Future<List<CryptoListingModel>> getLatestListing() async {
    final response = await dioClient.get(Config.baseUrl + Config.latest);
    if (response.statusCode == 200) {
      Iterable result = json.decode(response.data)["data"];
      return List<CryptoListingModel>.from(
          result.map((e) => CryptoListingModel.fromJson(e)));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CryptoInfoModel> getLogoOfCurrencyWithId(int id) async {
    final response = await dioClient.get(Config.baseUrl + Config.info);
    if (response.statusCode == 200) {
      return CryptoInfoModel.fromJson(
          json.decode(response.data)["data"][id.toString()]);
    } else {
      throw ServerException();
    }
  }
}
