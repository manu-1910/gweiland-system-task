import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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
  RemoteDataSourceImpl(this.dioClient);

  @override
  Future<List<CryptoListingModel>> getLatestListing() async {
    debugPrint(Config.baseUrl + Config.latest);
    final response = await dioClient.get(Config.baseUrl + Config.latest, options: Options(responseType: ResponseType.plain));
    debugPrint(response.statusCode.toString());
    debugPrint(response.data);
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
    debugPrint("${Config.baseUrl}${Config.info}&id=$id");
    final response =
        await dioClient.get("${Config.baseUrl}${Config.info}&id=$id", options: Options(responseType: ResponseType.plain));
    debugPrint(response.statusCode.toString());
    debugPrint(response.data);
    if (response.statusCode == 200) {
      return CryptoInfoModel.fromJson(
          json.decode(response.data)["data"][id.toString()]);
    } else {
      throw ServerException();
    }
  }
}
