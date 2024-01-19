import 'dart:math';

import 'package:reddit_task/reals/doman/models/real_entity.dart';
import 'package:reddit_task/reals/doman/repository/reals_repository.dart';

class RealsRepositoryImp implements RealsRepository {
  @override
  Future<RealEntity> realData() async {
    return RealEntity(
      userName: 'Xury46',
      userAvatar:
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
      realDescription:
          'After year of collection parts of this build, I Present my finished heavy-9 ',
      likes: 266,
      comments: 61,
      videoUrl: _urls[Random().nextInt(4)],
    );
  }

  @override
  Future<void> like() async {
    return;
  }

  @override
  Future<void> unLike() async {
    return;
  }
}

List<String> _urls = [
  'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  'https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
  'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
  'https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4',
];
