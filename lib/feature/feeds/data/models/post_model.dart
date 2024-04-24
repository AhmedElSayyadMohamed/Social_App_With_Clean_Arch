import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app/feature/feeds/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({
    required super.uId,
    super.id,
    required super.date,
    required super.containText,
    required super.image,
    required super.tags,
    required super.likesCounts,
    required super.commentsCounts,
  });

  factory PostModel.fromJson(QueryDocumentSnapshot post){
      return PostModel(
        uId: post['uid'],
        id: post.id,
        containText:post['containingOfPost'],
        image: post['postImage'],
        date: post['postDate'],
        tags: post['tags'],
        likesCounts: post['likes_count'],
        commentsCounts: post['comments_count'],
      );
  }
  toJson()=>{
    'uid':uId,
    'postImage':image,
    'containingOfPost':containText,
    'postDate':date,
    'tags':tags,
    'likes_count':likesCounts,
    'comments_count':commentsCounts,
  };
}
