import 'package:equatable/equatable.dart';

import 'comment.dart';

class Post extends Equatable {
  final String uId;
  final String id;
  final String date;
  final String containText;
  final String image;
  final List<dynamic> tags;
  final int likesCounts;
  final int commentsCounts;
  const Post( {
    required this.likesCounts,
    required this.commentsCounts,
    required this.uId,
    this.id ='',
    required this.date,
    required this.containText,
    required this.image,
    required this.tags,
  });

  @override
  List<Object> get props => [
        uId,
        id,
        date,
        containText,
        tags,
        image,
        likesCounts,
        commentsCounts,
      ];
}

