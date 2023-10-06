import 'dart:io';

import 'package:cam_torch/core/error/failure/failure.dart';
import 'package:cam_torch/core/error/failure/file_failure.dart';
import 'package:cam_torch/core/utils/use_case.dart';
import 'package:dartz/dartz.dart';

class DeleteImageUseCase extends UseCase<bool, File> {
  @override
  Future<Either<Failure, bool?>> call(File params) async {
    try {
      await params.delete();
      return const Right(true);
    } catch (_) {
      return Left(DeleteFileFailure());
    }
  }
}
