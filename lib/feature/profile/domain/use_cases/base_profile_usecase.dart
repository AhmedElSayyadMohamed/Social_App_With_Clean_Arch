import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';

abstract class BaseProfileUseCases <T,Parameters>{
  Future<Either<Failure,T>> call(Parameters parameters);
}