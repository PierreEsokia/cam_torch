import 'package:cam_torch/core/error/failure/camera_failure.dart';
import 'package:cam_torch/core/error/failure/failure.dart';
import 'package:cam_torch/core/utils/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestCameraPermissionUseCase extends UseCase<bool, dynamic> {
  @override
  Future<Either<Failure, bool?>> call(dynamic params) async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      final status = await Permission.camera.request();
      if (status == PermissionStatus.granted) {
        return const Right(true);
      } else {
        return Left(CameraNotPermittedFailure());
      }
    } else if (status.isGranted) {
      return const Right(true);
    }
    return Left(CameraNotPermittedFailure());
  }
}
