import 'package:adyacare_assignment/features/video_player/bloc/video_player_bloc.dart';
import 'package:adyacare_assignment/features/video_player/ui/video_player_options_widget.dart';
import 'package:adyacare_assignment/features/video_player/ui/video_player_widget.dart';
import 'package:adyacare_assignment/helpers/ui_object_model.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  final VideoPlayerBloc videoPlayerBloc = VideoPlayerBloc();

  @override
  void initState() {
    // Trigger the VideoPlayerInitialEvent to initialize the bloc
    videoPlayerBloc.add(VideoPlayerInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 50,
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://uploads-ssl.webflow.com/63dca1df3f26885fe13987e6/63dca27c0b558cb78bfd46e5_adya-header-logo-893ec57a37fc49316f55d03365b2ae47-p-500.webp'))),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocConsumer<VideoPlayerBloc, VideoPlayerState>(
        bloc: videoPlayerBloc,
        listenWhen: (previous, current) => current is VideoPlayerActionState,
        buildWhen: (previous, current) => current is! VideoPlayerActionState,
        listener: (context, state) {
          // Handle any necessary state changes or events
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case VideoPlayerSuccessVideoState:
              // Display the VideoPlayerWidget when VideoPlayerSuccessVideoState is received
              return VideoPlayerWidget(
                videoPlayerBloc: videoPlayerBloc,
                clickListener: uiModelClicked,
                uiModel: VideoPlayerWidgetUiModel(
                    controller: videoPlayerBloc.workingController),
              );

            default:
              // Show a CircularProgressIndicator while loading or for unknown states
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void uiModelClicked(UiObjectModel model) {
    switch (model.runtimeType) {
      case VideoPlayerWidgetUiModel:
        final uiModel = model as VideoPlayerWidgetUiModel;
        if (uiModel.showOptionsEvent) {
          // Trigger the VideoPlayerShowOptionsWidgetStateChangedEvent when showOptionsEvent is true
          videoPlayerBloc.add(VideoPlayerShowOptionsWidgetStateChangedEvent());
        }
        break;
      case VideoPlayerOptionsWidgetUiModel:
        final uiModel = model as VideoPlayerOptionsWidgetUiModel;
        // Trigger the VideoPlayerChangeFutureVideoEvent with the selected videoType
        videoPlayerBloc.add(
            VideoPlayerChangeFutureVideoEvent(videoType: uiModel.videoType!));
        break;
      default:
        // Handle any other UiObjectModel types if necessary
    }
  }
}
