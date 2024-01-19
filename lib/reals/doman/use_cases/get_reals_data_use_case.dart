import 'package:reddit_task/reals/doman/models/real_entity.dart';
import 'package:reddit_task/reals/doman/repository/reals_repository.dart';

class GetRealsDataUseCase {
  final RealsRepository _realsRepository;

  GetRealsDataUseCase(this._realsRepository);

  Future<RealEntity> execute() async {
    return await _realsRepository.realData();
  }
}
