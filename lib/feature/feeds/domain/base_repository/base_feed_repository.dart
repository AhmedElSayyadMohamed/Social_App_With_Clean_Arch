import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';

abstract class BaseFeedRepository{

Future<Either<Failure,void>> createPostWithImage();
}