import 'package:equatable/equatable.dart';
import '../../domain/entities/CryptoListing.dart';

class CryptoListingModel extends Equatable {
  final int id;
  final String name;
  final String symbol;
  final String slug;
  final int cmcRank;
  final int numMarketPairs;
  final double? circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final bool infiniteSupply;
  final String lastUpdated;
  final String dateAdded;
  final List<String> tags;
  final String platform;
  final Map<String, Quote> quote;

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
        quote
      ];

  const CryptoListingModel(
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
      required this.quote});

  factory CryptoListingModel.fromJson(Map<String, dynamic> json) =>
      CryptoListingModel(
          id: json["id"],
          name: json["name"],
          symbol: json["symbol"],
          slug: json["slug"],
          cmcRank: json["cmc_rank"],
          numMarketPairs: json["num_market_pairs"],
          circulatingSupply: (json["circulating_supply"] ?? 0).toDouble(),
          totalSupply: (json["total_supply"] ?? 0).toDouble(),
          maxSupply: (json["max_supply"] ?? 0).toDouble(),
          infiniteSupply: json["infinite_supply"],
          lastUpdated: json["last_updated"],
          dateAdded: json["date_added"],
          tags: List.empty(),
          platform: (json["platform"] ?? "").toString(),
          quote: {"USD": Quote.fromJson(json["quote"]["USD"]), "BTC": Quote.fromJson(json["quote"]["BTC"] ?? {})});

  CryptoListing toEntity() => CryptoListing(
      id: id,
      name: name,
      symbol: symbol,
      slug: slug,
      cmcRank: cmcRank,
      numMarketPairs: numMarketPairs,
      circulatingSupply: circulatingSupply ?? 0.0,
      totalSupply: totalSupply ?? 0.0,
      maxSupply: maxSupply ?? 0.0,
      infiniteSupply: infiniteSupply,
      lastUpdated: lastUpdated,
      dateAdded: dateAdded,
      tags: tags,
      platform: platform,
      quote: quote,
      logo: "");
}
