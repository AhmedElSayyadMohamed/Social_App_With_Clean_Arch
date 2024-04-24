import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:social_app/feature/feeds/data/models/post_model.dart';
import 'package:social_app/feature/feeds/data/remote_data_source/base_remote_data_source.dart';
import '../../../../core/constants.dart';
import '../../../../core/network/failure/failure.dart';
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
    PostModel postModel;
    if (post.image != '') {
      postModel = await uploadPostImageToFireStorage(post.image).then(
        (imageUrl) => PostModel(
          uId: post.uId,
          date: post.date,
          image: imageUrl,
          containText: post.containText,
          tags: post.tags,
          likesCounts: 0,
          commentsCounts: 0,
        ),
      );
    } else {
      postModel = PostModel(
        uId: post.uId,
        date: post.date,
        image: post.image,
        containText: post.containText,
        tags: post.tags,
        likesCounts: 0,
        commentsCounts: 0,
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

  Future<List<String>> getPostLikes(String postId) async {
    List<String> documentIds = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot;

    querySnapshot = await _fireStoreInstance
        .collection('UsersPosts')
        .doc('likes')
        .collection('posts')
        .doc(postId)
        .collection('usersId')
        .get();

    for (var doc in querySnapshot.docs) {
      documentIds.add(doc.id);
    }
    return documentIds;
  }

  @override
  Future<List<String>> toggleLikePostAndGetPostLikes(String postId) async {
    var usersId = await getPostLikes(postId);

    if (!usersId.contains(currentUserId)) {
      _fireStoreInstance
          .collection('UsersPosts')
          .doc('likes')
          .collection('posts')
          .doc(postId)
          .collection('usersId')
          .doc(currentUserId)
          .set({});
    } else {
      await _fireStoreInstance
          .collection('UsersPosts')
          .doc('likes')
          .collection('posts')
          .doc(postId)
          .collection('usersId')
          .doc(currentUserId)
          .delete();
    }
    return usersId ;
  }
}
