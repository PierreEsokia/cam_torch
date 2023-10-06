import 'package:cam_torch/features/home/domain/usecase/request_camera_permission_use_case.dart';
import 'package:cam_torch/features/home/domain/usecase/save_picture_use_case.dart';
import 'package:cam_torch/features/home/domain/usecase/take_picture_use_case.dart';
import 'package:cam_torch/features/home/presentation/bloc/home_bloc.dart';
import 'package:cam_torch/features/images/domain/usecase/delete_image_use_case.dart';
import 'package:cam_torch/features/images/domain/usecase/load_images_use_case.dart';
import 'package:cam_torch/features/images/presentation/bloc/images_bloc.dart';
import 'package:cam_torch/features/others/light/bloc/light_bloc.dart';
import 'package:cam_torch/features/others/light/usecase/toggle_torch_use_case.dart';
import 'package:get_it/get_it.dart';

part 'injections_bloc.dart';
part 'injections_use_case.dart';

final getIt = GetIt.instance;

Future<void> inject() async {
  injectionsUseCase();
  injectBloc();
}