import 'package:reddit_task/reals/doman/models/real_entity.dart';

abstract class RealsRepository{
  Future<RealEntity> realData();
  Future<void> like();
  Future<void> unLike();
}