part of 'images_bloc.dart';

class ImagesState extends Equatable {
  final List<File>? images;

  const ImagesState({
    this.images,
  });

  @override
  List<Object?> get props => [images];

  ImagesState copyWith({
    List<File>? images,
  }) {
    return ImagesState(
      images: images ?? this.images,
    );
  }
}

class LoadingImagesState extends ImagesState {
  const LoadingImagesState();

  @override
  List<Object?> get props => [images];
}

class LoadedImagesState extends ImagesState {
  const LoadedImagesState({required super.images});

  @override
  List<Object?> get props => [images];
}

class FailedLoadImagesState extends ImagesState {
  const FailedLoadImagesState();

  @override
  List<Object?> get props => [images];
}