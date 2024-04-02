import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/network/failure/failure.dart';

abstract class BaseAuthUseCases<T, Parameters> {

  Future<Either<Failure, T>> call(Parameters parameter);
}


class Parameters extends Equatable {

  final String email;
  final String password;

  const Parameters({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
class NoParameters{}

