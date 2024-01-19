import 'package:equatable/equatable.dart';

class RealEntity extends Equatable {
  final String userName;
  final String userAvatar;
  final String realDescription;
  final int likes;
  final int comments;
  final String videoUrl;

  const RealEntity({
    required this.userName,
    required this.userAvatar,
    required this.realDescription,
    required this.likes,
    required this.comments,
    required this.videoUrl,
  });

  RealEntity modify({
    int? likes,
  }) {
    return RealEntity(
      userName: userName,
      userAvatar: userAvatar,
      realDescription: realDescription,
      likes: likes ?? this.likes,
      comments: comments,
      videoUrl: videoUrl,
    );
  }

  @override
  List<Object?> get props => [
        userName,
        userAvatar,
        realDescription,
        likes,
        comments,
        videoUrl,
      ];
}
