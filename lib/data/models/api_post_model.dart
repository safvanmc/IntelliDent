import 'package:equatable/equatable.dart';

/// API Post Model for JSONPlaceholder API
class ApiPostModel extends Equatable {
  final int id;
  final int userId;
  final String title;
  final String body;

  const ApiPostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory ApiPostModel.fromJson(Map<String, dynamic> json) {
    return ApiPostModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }

  @override
  List<Object?> get props => [id, userId, title, body];
}
