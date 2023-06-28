import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:adyacare_assignment/features/video_player/bloc/video_player_bloc.dart';
import 'package:adyacare_assignment/helpers/ui_object_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoPlayerOptionsWidget extends StatelessWidget {
  final UiObjectModelClickListener clickListener;
  final VideoPlayerOptionsWidgetUiModel uiModel;
  final VideoPlayerBloc videoPlayerBloc;
  const VideoPlayerOptionsWidget(
      {super.key,
      required this.clickListener,
      required this.uiModel,
      required this.videoPlayerBloc});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoPlayerBloc, VideoPlayerState>(
      bloc: videoPlayerBloc,
      listenWhen: (previous, current) => current is VideoPlayerActionState,
      listener: (context, state) {},
      builder: (context, state) {
        return (videoPlayerBloc.showOptionsWidget)
            ? Align(
                alignment: Alignment.center,
                child: Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'How are you feeling today?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              clickListener.call(
                                  uiModel.copyWith(videoType: VideoType.happy));
                            },
                            child: const Text(
                              '😁',
                              style: TextStyle(fontSize: 34),
                            ),
                          ),
                          const SizedBox(width: 20),
                          InkWell(
                            onTap: () {
                              clickListener.call(
                                  uiModel.copyWith(videoType: VideoType.sad));
                            },
                            child: const Text(
                              '😢',
                              style: TextStyle(fontSize: 34),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Container();
      },
    );
  }
}

class VideoPlayerOptionsWidgetUiModel implements UiObjectModel {
  final VideoType? videoType;
  VideoPlayerOptionsWidgetUiModel({
    this.videoType,
  });

  VideoPlayerOptionsWidgetUiModel copyWith({
    VideoType? videoType,
  }) {
    return VideoPlayerOptionsWidgetUiModel(
      videoType: videoType ?? this.videoType,
    );
  }
}
