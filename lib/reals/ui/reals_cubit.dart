import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_task/di/app_injector.dart';
import 'package:reddit_task/reals/doman/use_cases/get_reals_data_use_case.dart';
import 'package:reddit_task/reals/doman/use_cases/like_use_case.dart';
import 'package:reddit_task/reals/doman/use_cases/un_like_use_case.dart';
import 'package:reddit_task/reals/ui/reals_state.dart';
import 'package:reddit_task/utils/async.dart';
import 'package:reddit_task/utils/bloc_utils.dart';

class RealsCubit extends Cubit<RealsState> {
  late final GetRealsDataUseCase _getRealsDataUseCase;
  late final LikeUseCase _likeUseCase;
  late final UnLikeUseCase _unLikeUseCase;

  RealsCubit() : super(const RealsState.initial()) {
    _getRealsDataUseCase = injector();
    _likeUseCase = injector();
    _unLikeUseCase = injector();
    getVideo();
  }

  void getVideo() {
    collect(task: () async {
      emit(state.reduce(real: const Async.loading()));
      final data = await _getRealsDataUseCase.execute();
      emit(state.reduce(real: Async.success(data)));
    }, onError: (errorMessage) {
      emit(state.reduce(real: Async.failure(errorMessage)));
    });
  }

  void like() {
    collect(task: () async {
      emit(state.reduce(like: const Async.loading()));
      await _likeUseCase.execute();
      if (state.real.data == null) return;
      emit(
        state.reduce(
          like: const Async.successWithoutData(),
          real: Async.success(
            state.real.data!.modify(likes: state.real.data!.likes + 1),
          ),
          unLike: const Async.initial(),
        ),
      );
    }, onError: (errorMessage) {
      emit(state.reduce(like: Async.failure(errorMessage)));
    });
  }

  void unLike() {
    collect(task: () async {
      emit(state.reduce(unLike: const Async.loading()));
      await _unLikeUseCase.execute();
      emit(
        state.reduce(
          unLike: const Async.successWithoutData(),
          real: Async.success(
            state.real.data!.modify(likes: state.real.data!.likes - 1),
          ),
          like: const Async.initial(),
        ),
      );
    }, onError: (errorMessage) {
      emit(state.reduce(unLike: Async.failure(errorMessage)));
    });
  }
}
