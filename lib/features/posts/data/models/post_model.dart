import 'package:fe_test_task/features/posts/domain/entities/post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends Post {
  const PostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  }) : super(
          id: id,
          userId: userId,
          title: title,
          body: body,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return _$PostModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PostModelToJson(this);
  }

  final int id;
  final int userId;
  final String title;
  final String body;
}
