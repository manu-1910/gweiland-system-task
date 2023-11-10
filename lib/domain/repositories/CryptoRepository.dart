import 'package:gweiland_exchange/domain/entities/CryptoListing.dart';

abstract class CryptoRepository {
  Future<CryptoListing?> getLatestListing();
}
