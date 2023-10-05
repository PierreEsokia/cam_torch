part of 'injections.dart';

void injectBloc() {
  getIt.registerFactory<HomeBloc>(() => HomeBloc(
        takePictureUseCase: getIt<TakePictureUseCase>(),
        requestCameraPermissionUseCase: getIt<RequestCameraPermissionUseCase>(),
        savePictureUseCase: getIt<SavePictureUseCase>(),
      ));

  getIt.registerFactory<LightBloc>(() => LightBloc(
        getIt<ToggleTorchUseCase>(),
      ));
}
