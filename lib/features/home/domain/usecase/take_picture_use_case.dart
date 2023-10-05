import 'package:cam_torch/core/error/failure/camera_failure.dart';
import 'package:cam_torch/core/error/failure/failure.dart';
import 'package:cam_torch/core/utils/log.dart';
import 'package:cam_torch/core/utils/use_case.dart';
import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';

class TakePictureUseCase extends UseCase<XFile, CameraController> {
  @override
  Future<Either<Failure, XFile>> call(CameraController params) async {
    try {
      final picture = await params.takePicture();
      Log.info(picture);
      return Right(picture);
    } on CameraException {
      return Left(TakePictureFailure());
    }
  }
}
