import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/network/failure/failure.dart';

abstract class BaseAuthUseCases<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameter);
}

class Parameters extends Equatable {
  final String? uId;
  final String? email;
  final String? password;

  const Parameters({
    this.uId,
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [uId, email, password];
}

class NoParameters {}
