import 'dart:collection';
import 'package:equatable/equatable.dart';

class CryptoListing extends Equatable {
  @override
  List<Object?> get props => [
        id,
        name,
        symbol,
        slug,
        cmcRank,
        numMarketPairs,
        circulatingSupply,
        totalSupply,
        maxSupply,
        infiniteSupply,
        lastUpdated,
        dateAdded,
        tags,
        platform,
        quote,
        logo
      ];

  final int id;
  final String name;
  final String symbol;
  final String slug;
  final int cmcRank;
  final int numMarketPairs;
  final int circulatingSupply;
  final int totalSupply;
  final int maxSupply;
  final bool infiniteSupply;
  final String lastUpdated;
  final String dateAdded;
  final List<String> tags;
  final String platform;
  final Map<String, Quote> quote;
  String logo;

  CryptoListing(
      {required this.id,
      required this.name,
      required this.symbol,
      required this.slug,
      required this.cmcRank,
      required this.numMarketPairs,
      required this.circulatingSupply,
      required this.totalSupply,
      required this.maxSupply,
      required this.infiniteSupply,
      required this.lastUpdated,
      required this.dateAdded,
      required this.tags,
      required this.platform,
      required this.quote,
      required this.logo});
}

class Quote extends Equatable {
  final int price;
  final String volume24hr;
  final String volume24hrChange;
  final String percentChange1Hr;
  final String percentChange24Hr;
  final int marketCap;
  final int marketCapDominance;
  final String lastUpdated;

  @override
  List<Object?> get props => [
        price,
        volume24hr,
        volume24hrChange,
        percentChange1Hr,
        percentChange24Hr,
        marketCap,
        marketCapDominance,
        lastUpdated
      ];

  const Quote(
      {required this.price,
      required this.volume24hr,
      required this.volume24hrChange,
      required this.percentChange1Hr,
      required this.percentChange24Hr,
      required this.marketCap,
      required this.marketCapDominance,
      required this.lastUpdated});

  factory Quote.fromJson(HashMap<String, dynamic> json) => Quote(
      price: json["price"],
      volume24hr: json["volume_24h"],
      volume24hrChange: json["volume_change_24h"],
      percentChange1Hr: json["percent_change_1h"],
      percentChange24Hr: json["percent_change_24h"],
      marketCap: json["market_cap"],
      marketCapDominance: json["market_cap_dominance"],
      lastUpdated: json["last_updated"]);
}
