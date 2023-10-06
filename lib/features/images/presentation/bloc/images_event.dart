part of 'images_bloc.dart';

class ImagesEvent extends Equatable {
  const ImagesEvent();

  @override
  List<Object> get props => [];
}

class LoadImagesEvent extends ImagesEvent {}

class DeleteImageEvent extends ImagesEvent {

  final File image;

  const DeleteImageEvent({
    required this.image,
  });

  DeleteImageEvent copyWith({
    File? image,
  }) {
    return DeleteImageEvent(
      image: image ?? this.image,
    );
  }

  @override
  List<Object> get props => [image];
}
