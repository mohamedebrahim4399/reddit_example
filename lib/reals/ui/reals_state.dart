import 'package:equatable/equatable.dart';
import 'package:reddit_task/reals/doman/models/real_entity.dart';
import 'package:reddit_task/utils/async.dart';

class RealsState extends Equatable {
  final Async<RealEntity> real;
  final Async<void> like;
  final Async<void> unLike;

  const RealsState(
    this.real,
    this.like,
    this.unLike,
  );

  const RealsState.initial()
      : this(
          const Async.initial(),
          const Async.initial(),
          const Async.initial(),
        );

  RealsState reduce({
    Async<RealEntity>? real,
    Async<void>? like,
    Async<void>? unLike,
  }) {
    return RealsState(
      real ?? this.real,
      like ?? this.like,
      unLike ?? this.unLike,
    );
  }

  @override
  List<Object?> get props => [
        real,
        like,
        unLike,
      ];
}
