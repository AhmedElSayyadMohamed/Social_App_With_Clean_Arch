import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';

abstract class BaseFeedUseCases<T, Parameter> {
  Future<Either<Failure, T>> call(Parameter parameter);
}
