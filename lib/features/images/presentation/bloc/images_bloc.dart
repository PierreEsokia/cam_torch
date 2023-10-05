import 'dart:io';

import 'package:cam_torch/features/images/domain/usecase/load_images_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'images_event.dart';

part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesBloc(this.loadImagesUseCase) : super(const LoadingImagesState()) {
    on<LoadImagesEvent>(_onLoadImages);
  }

  final LoadImagesUseCase loadImagesUseCase;

  Future<void> _onLoadImages(
      LoadImagesEvent event, Emitter<ImagesState> emit) async {
    final res = await loadImagesUseCase(null);
    res.fold(
      (l) => emit(
        const FailedLoadImagesState(),
      ),
      (r) => emit(
        LoadedImagesState(
          images: r,
        ),
      ),
    );
  }
}
