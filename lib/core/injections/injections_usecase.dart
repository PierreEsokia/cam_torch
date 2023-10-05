part of 'injections.dart';

void injectionsUseCase() {
  ///Inject LightBloc UseCase
  getIt.registerLazySingleton(() => ToggleTorchUseCase());

  ///Inject HomeBloc UseCase
  getIt.registerLazySingleton(() => RequestCameraPermissionUseCase());
  getIt.registerLazySingleton(() => TakePictureUseCase());
  getIt.registerLazySingleton(() => SavePictureUseCase());
}
