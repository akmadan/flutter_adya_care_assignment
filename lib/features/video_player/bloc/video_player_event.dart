part of 'video_player_bloc.dart';

@immutable
abstract class VideoPlayerEvent {}

class VideoPlayerInitialEvent extends VideoPlayerEvent {}

class VideoPlayerChangeFutureVideoEvent extends VideoPlayerEvent {
  final VideoType videoType;
  VideoPlayerChangeFutureVideoEvent({
    required this.videoType,
  });
}

class VideoPlayerShowOptionsWidgetStateChangedEvent extends VideoPlayerEvent {}
