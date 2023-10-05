
part of 'injections.dart';

void injectBloc(){
  getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt<RequestCameraPermissionUseCase>()));
  getIt.registerFactory<LightBloc>(() => LightBloc(getIt<ToggleTorchUseCase>()));
}