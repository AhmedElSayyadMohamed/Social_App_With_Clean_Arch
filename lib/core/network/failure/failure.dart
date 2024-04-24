import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String msg;

  const Failure({required this.msg});

  @override
  List<Object> get props => [msg];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.msg});
}

class CacheErrorException extends Failure {
  const CacheErrorException({required super.msg});
}

class ServerErrorException implements Exception {
  final String? msg;

  ServerErrorException({this.msg});
}