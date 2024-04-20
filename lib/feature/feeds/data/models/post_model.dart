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
