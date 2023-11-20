class Config {
  static const String apiKey = "bff9be2f-bce0-4680-8bbe-846b130d0c7b";
  static const String baseUrl = "https://pro-api.coinmarketcap.com/";
  static const String latest = "v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=${apiKey}&limit=20";
  static const String info = "v2/cryptocurrency/info?CMC_PRO_API_KEY=${apiKey}";
}
