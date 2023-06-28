part of 'video_player_bloc.dart';

@immutable
abstract class VideoPlayerState {}

abstract class VideoPlayerActionState extends VideoPlayerState {}

abstract class VideoPlayerSuccessState extends VideoPlayerState {}

class VideoPlayerInitialState extends VideoPlayerState {}

class VideoPlayerSuccessVideoState extends VideoPlayerSuccessState {}

class VideoPlayerShowOptionsState extends VideoPlayerActionState {}
