

part of 'injections.dart';

void injectionsUsecase(){
  getIt.registerLazySingleton(() => ToggleTorchUseCase());
}