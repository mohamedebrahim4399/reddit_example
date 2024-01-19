import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_task/reals/doman/models/real_entity.dart';
import 'package:reddit_task/reals/ui/reals_cubit.dart';
import 'package:reddit_task/utils/icons/svg_icon.dart';
import 'package:reddit_task/utils/icons/svg_icon_paths.dart';
import 'package:video_player/video_player.dart';

class RealControllersView extends StatefulWidget {
  final VideoPlayerController controller;
  final RealEntity real;

  const RealControllersView(
      {super.key, required this.controller, required this.real});

  @override
  State<RealControllersView> createState() => _RealControllersViewState();
}

class _RealControllersViewState extends State<RealControllersView> {
  bool isMute = false;

  void muteToggle() {
    isMute ? widget.controller.setVolume(1) : widget.controller.setVolume(0);
    isMute = !isMute;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => context.read<RealsCubit>().like(),
          child: const SvgIcon(
            icon: SvgIconPath.like,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          widget.real.likes.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        IconButton(
          onPressed: () => context.read<RealsCubit>().unLike(),
          icon: const SvgIcon(
            icon: SvgIconPath.unLike,
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: SvgIcon(
            icon: SvgIconPath.comment,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          widget.real.comments.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgIcon(
            icon: SvgIconPath.share,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: muteToggle,
          icon: SvgIcon(
            icon: isMute ? SvgIconPath.mute : SvgIconPath.unMute,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
