
part of 'injections.dart';

void injectBloc(){
  getIt.registerFactory<HomeBloc>(() => HomeBloc());
  getIt.registerFactory<LightBloc>(() => LightBloc());
}