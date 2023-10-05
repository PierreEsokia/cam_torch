import 'package:cam_torch/core/error/failure/failure.dart';
import 'package:cam_torch/core/utils/use_case.dart';
import 'package:cam_torch/features/others/light/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:torch_light/torch_light.dart';


class ToggleTorchUseCase extends UseCase<bool, bool> {
  @override
  Future<Either<Failure, bool>> call(bool params) async {
    if (params) {
      try {
        await TorchLight.enableTorch();
        return  Right(!params);
      } on EnableTorchExistentUserException catch (_) {
        return Left(TorchNotExistFailure());
      } on EnableTorchNotAvailableException catch (_) {
        return Left(TorchNotAvailableFailure());
      } on EnableTorchException catch (_) {
        return Left(TorchNotEnableOrDisable());
      }
    } else {
      try {
        await TorchLight.disableTorch();
        return Right(!params);
      } on DisableTorchExistentUserException catch (_) {
        return Left(TorchNotExistFailure());
      } on DisableTorchNotAvailableException catch (_) {
        return Left(TorchNotAvailableFailure());
      } on DisableTorchException catch (_) {
        return Left(TorchNotEnableOrDisable());
      }
    }
  }
}
