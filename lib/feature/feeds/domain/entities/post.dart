import 'package:equatable/equatable.dart';

import 'comment.dart';

class Post extends Equatable {
  final String uId;
  final String id;
  final String date;
  final String containText;
  final String image;
  final List<Comment> comments;
  final List<String> likes;

  const Post(
    this.uId,
    this.id,
    this.date,
    this.containText,
    this.comments,
    this.likes,
    this.image,
  );

  @override
  List<Object> get props => [
        uId,
        id,
        date,
        containText,
        comments,
        likes,
        image,
      ];
}

