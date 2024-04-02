import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String msg;

  const Failure({required this.msg});

  @override
  List<Object> get props => [msg];
}

class ServerErrorException extends Failure {
  const ServerErrorException({required super.msg});
}

class CacheErrorException extends Failure {
  const CacheErrorException({required super.msg});
}