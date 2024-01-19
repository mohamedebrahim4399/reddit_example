import 'package:reddit_task/di/app_injector.dart';
import 'package:reddit_task/reals/data/reals_repository_imp.dart';
import 'package:reddit_task/reals/doman/repository/reals_repository.dart';
import 'package:reddit_task/reals/doman/use_cases/get_reals_data_use_case.dart';
import 'package:reddit_task/reals/doman/use_cases/like_use_case.dart';
import 'package:reddit_task/reals/doman/use_cases/un_like_use_case.dart';

class RealsDi {
  RealsDi._();

  static Future<void> initialize() async {
    injector.registerFactory<RealsRepository>(() => RealsRepositoryImp());
    injector.registerFactory(() => GetRealsDataUseCase(injector()));
    injector.registerFactory(() => LikeUseCase(injector()));
    injector.registerFactory(() => UnLikeUseCase(injector()));
  }
}
