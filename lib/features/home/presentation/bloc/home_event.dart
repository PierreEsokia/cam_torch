part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RequestCameraPermissionEvent extends HomeEvent {
}

class TakePictureEvent extends HomeEvent {

  final CameraController controller;

  TakePictureEvent({
    required this.controller,
  });

  @override
  List<Object> get props => [controller];
}

class SavePictureEvent extends HomeEvent {

  final Uint8List image;

  SavePictureEvent({
    required this.image,
  });

  @override
  List<Object> get props => [image];
}

