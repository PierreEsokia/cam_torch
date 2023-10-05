import 'dart:io';

import 'package:cam_torch/core/error/failure/failure.dart';
import 'package:cam_torch/core/error/failure/file_failure.dart';
import 'package:cam_torch/core/utils/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';

class LoadImagesUseCase extends UseCase<List<File>, dynamic> {
  @override
  Future<Either<Failure, List<File>?>> call(params) async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final List<File> files = directory
          .listSync()
          .whereType<File>()
          .toList()
          .map((e) => e)
          .toList();
      return Right(files);
    } catch (_) {
      return Left(LoadFileFailure());
    }
  }
}
