import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/network/failure/failure.dart';

abstract class BaseAuthUseCases<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameter);
}

