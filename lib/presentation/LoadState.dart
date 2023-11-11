import 'package:equatable/equatable.dart';

abstract class LoadState extends Equatable {
  const LoadState();
  @override
  List<Object?> get props => [];
}

class EmptyState extends LoadState {}

class LoadingState extends LoadState {}

class LoadError extends LoadState {
  final String message;

  LoadError(this.message);

  @override
  List<Object?> get props => [message];
}

class LoadedData extends LoadState {
  final dynamic data;
  const LoadedData(this.data);
  @override
  List<Object?> get props => [data];
}
