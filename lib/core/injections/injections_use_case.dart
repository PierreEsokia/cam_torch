part of 'injections.dart';

void injectionsUseCase() {
  ///Inject for LightBloc
  getIt.registerLazySingleton(() => ToggleTorchUseCase());

  ///Inject for HomeBloc
  getIt.registerLazySingleton(() => RequestCameraPermissionUseCase());
  getIt.registerLazySingleton(() => TakePictureUseCase());
  getIt.registerLazySingleton(() => SavePictureUseCase());

  ///Inject for ImagesBloc
  getIt.registerLazySingleton(() => LoadImagesUseCase());
}
