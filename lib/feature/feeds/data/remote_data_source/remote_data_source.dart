import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:social_app/feature/feeds/data/models/post_model.dart';
import 'package:social_app/feature/feeds/data/remote_data_source/base_remote_data_source.dart';
import '../../../../core/constants.dart';
import '../../../../core/network/failure/failure.dart';
import '../../domain/entities/post.dart';

class FeedsRemoteDataSource extends BaseFeedRemoteDataSource {
  final _fireStoreInstance = FirebaseFirestore.instance;

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
        .collection('users')
        .doc(currentUserId)
        .collection('myPosts')
        .add(postModel.toJson())
        .then((value) async {
      await _fireStoreInstance
          .collection('usersPosts')
          .doc()
          .set(postModel.toJson())
          .catchError((error) {
        throw ServerErrorException(msg: error.toString());
      }).catchError(
        (error) {
          throw ServerErrorException(msg: error.toString());
        },
      );
    }).catchError(
      (error) {
        throw ServerErrorException(msg: error.toString());
      },
    );
  }

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
  Future<List<PostModel>> getMyPostsById(String uId) async {
    final List<PostModel> posts = await _fireStoreInstance
        .collection('users')
        .doc(uId)
        .collection('myPosts')
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

  @override
  Future<void> likePost(Post post) async {
    var likesId;
    print(likesId);

    if (!likesId.contains(currentUserId)) {
      _fireStoreInstance
          .collection('users')
          .doc(post.uId)
          .collection('likes')
          .doc('posts')
          .collection(post.id)
          .doc(currentUserId)
          .set({});
    } else {
      await _fireStoreInstance
          .collection('users')
          .doc(post.uId)
          .collection('likes')
          .doc('posts')
          .collection(post.id)
          .doc(currentUserId)
          .delete();
    }
  }

  // Stream<List<String>> getPostLikesCountStream(Post post) {
  //   StreamController<List<String>> controller = StreamController<List<String>>();
  //
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(post.uId)
  //       .collection('likes')
  //       .doc('posts')
  //       .collection(post.id)
  //       .snapshots()
  //       .listen((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
  //     List<String> documentIds = [];
  //     for (var element in querySnapshot.docs) {
  //       documentIds.add(element.id);
  //     }
  //     controller.add(documentIds);
  //   }, onError: (error) {
  //     controller.addError(error);
  //   });
  //
  //   return controller.stream;
  // }

Future<List<String>> getPostLikesCount(Post post) async {
    List<String> documentIds = [];

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(post.uId)
        .collection('likes')
        .doc('posts')
        .collection(post.id)
        .get();
    for (var element in querySnapshot.docs) {
      documentIds.add(element.id);
    }
    return documentIds;
  }

  @override
  Future<List<PostModel>> getTimeLinePosts(List<dynamic> followingUsersId) async{
    List<PostModel> timelinePosts = [];
    List<PostModel> userPosts =[];
    followingUsersId.insert(0, currentUserId);
    try {
      for (String followingId in followingUsersId) {
        final QuerySnapshot userPostsSnapshot = await _fireStoreInstance
            .collection('users')
            .doc(followingId)
            .collection('myPosts')
            .orderBy('postDate', descending: true)
            .get();

        userPosts = userPostsSnapshot.docs.map((doc) => PostModel.fromJson(doc)).toList();
       for (var element in userPosts) {
         if(isDateToday(element.date)){
           timelinePosts.add(element);
         }
       }
      }

      timelinePosts.sort((a, b) => b.date.compareTo(a.date));

      return timelinePosts;
    } catch (error) {
      throw ServerErrorException(msg: error.toString());
    }

  }
  bool isDateToday(String dateTime) {
    var date = DateTime.parse(dateTime);
    DateTime now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }
}
