import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final String uId;
  final String id;
  final String comment;

  const Comment(this.uId, this.id, this.comment);
  @override
  List<Object> get props => [uId, id, comment];
}
