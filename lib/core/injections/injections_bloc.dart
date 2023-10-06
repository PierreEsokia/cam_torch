part of 'injections.dart';

void injectBloc() {
  getIt.registerFactory<LightBloc>(
    () => LightBloc(getIt<ToggleTorchUseCase>()),
  );

  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(
      takePictureUseCase: getIt<TakePictureUseCase>(),
      requestCameraPermissionUseCase: getIt<RequestCameraPermissionUseCase>(),
      savePictureUseCase: getIt<SavePictureUseCase>(),
    ),
  );

  getIt.registerFactory<ImagesBloc>(
    () => ImagesBloc(
      loadImagesUseCase: getIt<LoadImagesUseCase>(),
      deleteImageUseCase: getIt<DeleteImageUseCase>(),
    ),
  );
}
