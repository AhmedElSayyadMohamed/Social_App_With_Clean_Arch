import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/feeds/domain/entities/post.dart';

abstract class BaseFeedUseCases<T, Parameter> {
  Future<Either<Failure, T>> call(Parameter parameter);
}

class Parameters {
  final String imageFile;
  final String uId;
  final Post? post;

  Parameters( {
    this.post,
    this.imageFile = '',
    this.uId = '',
  });
}

class NoParameters {}
