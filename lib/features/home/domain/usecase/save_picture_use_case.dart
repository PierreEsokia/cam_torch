import 'dart:io';

import 'package:cam_torch/core/error/failure/failure.dart';
import 'package:cam_torch/core/utils/use_case.dart';
import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';

class SavePictureUseCase extends UseCase<bool, XFile> {
  @override
  Future<Either<Failure, bool>> call(XFile params) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg');
    await file.writeAsBytes(await params.readAsBytes());
    return const Right(true);
  }
}