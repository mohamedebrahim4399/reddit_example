import 'package:flutter/material.dart';
import 'package:reddit_task/utils/icons/svg_icon.dart';
import 'package:reddit_task/utils/icons/svg_icon_paths.dart';
import 'package:video_player/video_player.dart';

class VideoControllersView extends StatefulWidget {
  final VideoPlayerController videoController;

  const VideoControllersView({
    super.key,
    required this.videoController,
  });

  @override
  State<VideoControllersView> createState() => _VideoControllersViewState();
}

class _VideoControllersViewState extends State<VideoControllersView> {
  @override
  void initState() {
    widget.videoController.addListener(() async {
      thumbValue =
          (await widget.videoController.position)?.inMilliseconds.toDouble() ??
              0;
      setState(() {});
    });
    super.initState();
  }

  double thumbValue = 0;
  bool isPlay = true;

  void seek(double value) async {
    thumbValue = value;
    await widget.videoController.pause();
    await widget.videoController.seekTo(Duration(milliseconds: value.toInt()));
    await widget.videoController.play();
    setState(() {});
  }

  void _playPause() async {
    isPlay
        ? await widget.videoController.pause()
        : await widget.videoController.play();
    isPlay = !isPlay;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: _playPause,
          icon: SvgIcon(
            icon: isPlay ? SvgIconPath.play : SvgIconPath.pause,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Slider(
            value: thumbValue,
            max:
                widget.videoController.value.duration.inMilliseconds.toDouble(),
            min: 0.0,
            onChanged: seek,
            activeColor: Colors.white,
            inactiveColor: Colors.white38,
          ),
        ),
        Text(
          _convertDurationToTime(Duration(milliseconds: thumbValue.toInt())),
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }

  String _convertDurationToTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (twoDigits(duration.inHours) != '00') {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
  }
}
