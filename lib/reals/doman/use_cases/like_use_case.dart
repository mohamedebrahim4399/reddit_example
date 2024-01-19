import 'package:reddit_task/reals/doman/models/real_entity.dart';
import 'package:reddit_task/reals/doman/repository/reals_repository.dart';

class LikeUseCase {
  final RealsRepository _realsRepository;

  LikeUseCase(this._realsRepository);

  Future<void> execute() async {
    return await _realsRepository.like();
  }
}
