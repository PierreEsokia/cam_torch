import 'dart:typed_data';

import 'package:cam_torch/features/home/domain/usecase/request_camera_permission_use_case.dart';
import 'package:cam_torch/features/home/domain/usecase/save_picture_use_case.dart';
import 'package:cam_torch/features/home/domain/usecase/take_picture_use_case.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.requestCameraPermissionUseCase,
    required this.takePictureUseCase,
    required this.savePictureUseCase,
  }) : super(const InitialState()) {
    on<RequestCameraPermissionEvent>(_onRequestCameraPermission);
    on<TakePictureEvent>(_onTakePicture);
    on<SavePictureEvent>(_onSaveImage);
  }

  final RequestCameraPermissionUseCase requestCameraPermissionUseCase;
  final TakePictureUseCase takePictureUseCase;
  final SavePictureUseCase savePictureUseCase;

  Future<void> _onRequestCameraPermission(
      RequestCameraPermissionEvent event, Emitter<HomeState> emit) async {
    final res = await requestCameraPermissionUseCase(null);
    res.fold(
      (l) => emit(
        state.copyWith(
          status: HomeStatus.none,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: HomeStatus.take,
        ),
      ),
    );
  }

  Future<void> _onTakePicture(
      TakePictureEvent event, Emitter<HomeState> emit) async {
    final res = await takePictureUseCase(event.controller);
    res.fold(
      (l) => null,
      (r) => emit(
        state.copyWith(
          status: HomeStatus.save,
          image: r,
        ),
      ),
    );
  }

  Future<void> _onSaveImage(
      SavePictureEvent event, Emitter<HomeState> emit) async {
    final res = await savePictureUseCase(event.image);
    res.fold(
      (l) => null,
      (r) => emit(const InitialState()),
    );
  }
}
