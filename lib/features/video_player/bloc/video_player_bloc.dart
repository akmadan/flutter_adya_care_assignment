import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';

enum VideoType { initial, happy, sad }

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  VideoPlayerBloc() : super(VideoPlayerInitialState()) {
    on<VideoPlayerInitialEvent>(videoPlayerInitialEvent);
    on<VideoPlayerChangeFutureVideoEvent>(videoPlayerChangeFutureVideoEvent);
    on<VideoPlayerShowOptionsWidgetStateChangedEvent>(
        videoPlayerShowOptionsWidgetStateChangedEvent);
  }

  late ChewieController workingController;

  late ChewieController _chewieControllerInitial;
  late ChewieController _chewieControllerSad;
  late ChewieController _chewieControllerHappy;

  bool showOptionsWidget = false;

  ChewieController createController(String videoPath) {
    return ChewieController(
        showControlsOnInitialize: false,
        videoPlayerController: VideoPlayerController.asset(videoPath),
        autoPlay: true,
        looping: true,
        showControls: true,
        aspectRatio: 9 / 16);
  }

  FutureOr<void> videoPlayerInitialEvent(
      VideoPlayerInitialEvent event, Emitter<VideoPlayerState> emit) {
    _chewieControllerInitial = createController('assets/initial_video.mp4');
    _chewieControllerHappy = createController('assets/happy_video.mp4');
    _chewieControllerSad = createController('assets/sad_video.mp4');
    workingController = _chewieControllerInitial;

    emit(VideoPlayerSuccessVideoState());
  }

  FutureOr<void> videoPlayerShowOptionsWidgetStateChangedEvent(
      VideoPlayerShowOptionsWidgetStateChangedEvent event,
      Emitter<VideoPlayerState> emit) {
    showOptionsWidget = true;

    emit(VideoPlayerShowOptionsState());
  }

  FutureOr<void> videoPlayerChangeFutureVideoEvent(
      VideoPlayerChangeFutureVideoEvent event, Emitter<VideoPlayerState> emit) {
    showOptionsWidget = false;
    switch (event.videoType) {
      case VideoType.happy:
        workingController = _chewieControllerHappy;

        break;
      case VideoType.sad:
        workingController = _chewieControllerSad;

        break;
      case VideoType.initial:
        workingController = _chewieControllerInitial;

        break;

      default:
        workingController = _chewieControllerInitial;
    }
    emit(VideoPlayerSuccessVideoState());
  }
}
