# Non Linear Video Player

This Flutter project demonstrates a video player functionality using the `chewie` package and BLoC architecture.

## Features

- Play and loop different videos.
- Show options widget to select the video type.
- Display video player controls.

## Prerequisites

- Flutter SDK installed on your machine.

## Getting Started

1. Clone the repository:

2. Navigate to the project directory:

3. Install the dependencies:

4. Run the app:


## Files

### bloc/video_player_bloc.dart

This file contains the `VideoPlayerBloc` class, which extends the `Bloc` class from the `bloc` package. It manages the state and business logic for the video player feature. It handles events and emits corresponding states.

### bloc/video_player_event.dart

This file defines the events that can be dispatched to the `VideoPlayerBloc`. It includes events such as `VideoPlayerInitialEvent` and `VideoPlayerChangeFutureVideoEvent` for initializing and changing the future video respectively.

### bloc/video_player_state.dart

This file defines the states that the `VideoPlayerBloc` can emit. It includes states such as `VideoPlayerInitialState` and `VideoPlayerSuccessVideoState` to represent the initial and successful video states respectively.

### ui/video_player_page.dart

This file contains the `VideoPlayerPage` class, which is a `StatefulWidget` representing the main page of the video player feature. It initializes the `VideoPlayerBloc` and handles user interactions with the video player widget.

### ui/video_player_widget.dart

This file contains the `VideoPlayerWidget` class, which is a `StatefulWidget` representing the video player widget. It receives the `VideoPlayerBloc` and a `UiObjectModelClickListener` as parameters. It displays the video player using the `chewie` package and handles user interactions.

### ui/video_player_options_widget.dart

This file contains the `VideoPlayerOptionsWidget` class, which is a `StatelessWidget` representing the options widget for selecting the video type. It receives the `VideoPlayerBloc`, `UiObjectModelClickListener`, and a `VideoPlayerOptionsWidgetUiModel` as parameters. It displays the options widget and handles user interactions to change the video type.

### helpers/ui_object_model.dart

This file contains the `UiObjectModel` interface, which is implemented by different UI models used in the app. It provides a common interface for interacting with UI models.

## Credits

- [chewie](https://pub.dev/packages/chewie) package for the video player functionality.



