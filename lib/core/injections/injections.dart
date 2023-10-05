import 'package:cam_torch/features/home/presentation/bloc/home_bloc.dart';
import 'package:cam_torch/features/others/light/bloc/light_bloc.dart';
import 'package:cam_torch/features/others/light/usecase/toggle_torch_use_case.dart';
import 'package:get_it/get_it.dart';


part 'injections_bloc.dart';
part 'injections_usecase.dart';


final getIt = GetIt.instance;

Future<void> inject() async {
  injectionsUsecase();
  injectBloc();
}