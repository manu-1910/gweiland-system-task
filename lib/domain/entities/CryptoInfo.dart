import 'package:equatable/equatable.dart';

class CryptoInfo extends Equatable {
  @override
  List<Object?> get props => [logo];

  final String logo;

  const CryptoInfo({required this.logo});
}
