import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app/feature/feeds/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({
    required super.uId,
    required super.date,
    required super.containText,
    required super.comments,
    required super.likes,
    required super.image,
    required super.tags,
  });

  factory PostModel.fromJson(QueryDocumentSnapshot post){
      return PostModel(
        uId: post['uid'],
        containText:post['containingOfPost'],
        image: post['postImage'],
        date: post['postDate'],
        likes: post['likes'],
        tags: post['tags'],
        comments:const[],
      );
  }
  toJson()=>{
    'uid':uId,
    'postImage':image,
    'containingOfPost':containText,
    'postDate':date,
    'likes':likes,
    'comments':comments,
    'tags':tags,
  };
}
