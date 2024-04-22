import 'package:equatable/equatable.dart';

import 'comment.dart';

class Post extends Equatable {
  final String uId;
  final String date;
  final String containText;
  final String image;
  final List<Comment> comments;
  final List<dynamic> likes;
  final List<dynamic> tags;

  const Post( {
    required this.uId,
    required this.date,
    required this.containText,
    required this.comments,
    required this.likes,
    required this.image,
    required this.tags,
  });

  @override
  List<Object> get props => [
        uId,
        date,
        containText,
        comments,
        likes,
        tags,
        image,
      ];
}

