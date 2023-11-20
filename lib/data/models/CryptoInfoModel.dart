import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:gweiland_exchange/domain/entities/CryptoInfo.dart';

class CryptoInfoModel extends Equatable {
  @override
  List<Object?> get props => [logo];

  final String logo;

  const CryptoInfoModel({required this.logo});

  factory CryptoInfoModel.fromJson(json) =>
      CryptoInfoModel(logo: json["logo"]);

  CryptoInfo toEntity() => CryptoInfo(logo: logo);
}
