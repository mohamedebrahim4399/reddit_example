import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_task/reals/ui/reals_cubit.dart';
import 'package:reddit_task/reals/ui/reals_state.dart';
import 'package:reddit_task/reals/ui/widgets/video_view.dart';

class RealsPage extends StatefulWidget {
  const RealsPage({super.key});

  @override
  State<RealsPage> createState() => _RealsPageState();
}

class _RealsPageState extends State<RealsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RealsCubit(),
      child: BlocBuilder<RealsCubit, RealsState>(
        builder: (context, state) {
          if (state.real.isSuccess && state.real.data != null) {
            return Stack(
              children: [VideoWidget(real: state.real.data!)],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
