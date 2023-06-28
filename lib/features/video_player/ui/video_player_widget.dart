import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:adyacare_assignment/features/video_player/bloc/video_player_bloc.dart';
import 'package:adyacare_assignment/features/video_player/ui/video_player_options_widget.dart';
import 'package:adyacare_assignment/helpers/ui_object_model.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerWidgetUiModel uiModel;
  final UiObjectModelClickListener clickListener;
  final VideoPlayerBloc videoPlayerBloc;
  const VideoPlayerWidget(
      {super.key,
      required this.uiModel,
      required this.videoPlayerBloc,
      required this.clickListener});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  Timer? _positionTimer;

  @override
  void initState() {
    super.initState();
    widget.uiModel.controller.play();
    _positionTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      Duration position =
          widget.uiModel.controller.videoPlayerController.value.position;
      if (position.inSeconds == 4) {
        if (widget.uiModel.controller.isPlaying) {
          widget.uiModel.controller.pause();

          widget.clickListener
              .call(widget.uiModel.copyWith(showOptionsEvent: true));
        }
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoPlayerBloc, VideoPlayerState>(
      bloc: widget.videoPlayerBloc,
      listenWhen: (previous, current) => current is VideoPlayerActionState,
      buildWhen: (previous, current) => current is! VideoPlayerActionState,
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 9 / 16,
                child: Stack(
                  children: [
                    Chewie(controller: widget.uiModel.controller),
                    VideoPlayerOptionsWidget(
                        clickListener: widget.clickListener,
                        uiModel: VideoPlayerOptionsWidgetUiModel(),
                        videoPlayerBloc: widget.videoPlayerBloc)
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class VideoPlayerWidgetUiModel extends UiObjectModel {
  final ChewieController controller;
  final bool showOptionsEvent;
  VideoPlayerWidgetUiModel(
      {required this.controller, this.showOptionsEvent = false});

  VideoPlayerWidgetUiModel copyWith({
    ChewieController? controller,
    bool? showOptionsEvent,
  }) {
    return VideoPlayerWidgetUiModel(
      controller: controller ?? this.controller,
      showOptionsEvent: showOptionsEvent ?? this.showOptionsEvent,
    );
  }
}
