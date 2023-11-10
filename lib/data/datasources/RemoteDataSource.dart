import 'dart:convert';
import 'dart:html';

import 'package:dio/dio.dart';
import 'package:gweiland_exchange/data/ServerException.dart';
import 'package:gweiland_exchange/data/config.dart';
import 'package:gweiland_exchange/data/models/CryptoListingModel.dart';
import 'package:gweiland_exchange/domain/entities/CryptoListing.dart';

abstract class RemoteDataSource {
  Future<List<CryptoListingModel>> getLatestListing();
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
}
