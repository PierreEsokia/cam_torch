import 'package:cam_torch/features/home/presentation/bloc/home_bloc.dart';
import 'package:cam_torch/features/others/light/light_bloc.dart';
import 'package:get_it/get_it.dart';


part 'injections_bloc.dart';


final getIt = GetIt.instance;

Future<void> inject() async {
  injectBloc();
}