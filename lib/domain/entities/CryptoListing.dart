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
  final double circulatingSupply;
  final double totalSupply;
  final double maxSupply;
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
  final double price;
  final double volume24hr;
  final double volume24hrChange;
  final double percentChange1Hr;
  final double percentChange24Hr;
  final double marketCap;
  final double marketCapDominance;
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

  factory Quote.fromJson(json) => Quote(
      price: json["price"] ?? 0.0,
      volume24hr: json["volume_24h"] ?? 0.0,
      volume24hrChange: (json["volume_change_24h"] ?? 0.0).toDouble(),
      percentChange1Hr: (json["percent_change_1h"] ?? 0.0).toDouble(),
      percentChange24Hr: (json["percent_change_24h"] ?? 0.0).toDouble(),
      marketCap: (json["market_cap"] ?? 0.0).toDouble(),
      marketCapDominance: (json["market_cap_dominance"] ?? 0.0).toDouble(),
      lastUpdated: json["last_updated"] ?? "");
}
