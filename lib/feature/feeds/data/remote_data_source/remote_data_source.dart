import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/feeds/data/models/post_model.dart';
import 'package:social_app/feature/feeds/data/remote_data_source/base_remote_data_source.dart';
import '../../../../core/constants.dart';
import '../../domain/entities/post.dart';

class FeedsRemoteDataSource extends BaseFeedRemoteDataSource {
  final _fireStoreInstance = FirebaseFirestore.instance;
  @override
  Future<String> uploadPostImageToFireStorage(String imageFile) async {
    // get instance from fireStorage
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref();
    final imageRef =
        ref.child('UserPostsImage/Users/$currentUserId/${DateTime.now()}.jpg');
    UploadTask uploadTask = imageRef.putFile(File(imageFile));

    try {
      final image = await uploadTask;
      final imageUrl = await image.ref.getDownloadURL();
      return imageUrl;
    } catch (error) {
      throw ServerErrorException(msg: error.toString());
    }
  }

  @override
  Future<void> addPost(Post post) async {

    PostModel postModel ;
    if(post.image !=''){
      postModel = await uploadPostImageToFireStorage(post.image).then(
              (imageUrl)=> PostModel(
                uId: post.uId,
                date: post.date,
                image: imageUrl,
                containText: post.containText,
                comments: post.comments,
                likes: post.likes,
                tags: post.tags,
              )
      );

    } else{
      postModel = PostModel(
        uId: post.uId,
        date: post.date,
        image: post.image,
        containText: post.containText,
        comments: post.comments,
        likes: post.likes,
        tags: post.tags,
      );
    }

      await _fireStoreInstance
          .collection('UsersPosts')
          .doc(currentUserId)
          .collection('MyPosts')
          .add(postModel.toJson())
          .catchError(
            (error) {
          throw ServerErrorException(msg: error.toString());
        },
      );

  }

  @override
  Future<List<PostModel>> getMyPostsById(String uId) async {
    final List<PostModel> posts = await _fireStoreInstance
        .collection('UsersPosts')
        .doc(uId)
        .collection('MyPosts')
        .orderBy('postDate', descending: true)
        .get()
        .then(
      (posts) {
        return posts.docs.map((e) => PostModel.fromJson(e)).toList();
      },
    ).catchError(
      (error) {
        throw ServerErrorException(msg: error.toString());
      },
    );
    return posts;
  }
}
