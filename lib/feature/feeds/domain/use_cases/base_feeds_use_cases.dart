import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';

abstract class BaseFeedUseCases<T, Parameter> {
  Future<Either<Failure, T>> call(Parameter parameter);
}

class Parameters {
  final String imageFile;
  final String uId;
  final String postId;
  final bool isLikePost;

  Parameters({
    this.isLikePost = false,
    this.postId = '',
    this.imageFile = '',
    this.uId = '',
  });
}

class NoParameters {}
