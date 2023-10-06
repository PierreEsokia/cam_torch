import 'dart:io';
import 'dart:typed_data';

import 'package:cam_torch/core/error/failure/failure.dart';
import 'package:cam_torch/core/utils/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';

class SavePictureUseCase extends UseCase<bool, Uint8List> {
  @override
  Future<Either<Failure, bool>> call(Uint8List params) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file =
        File('${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg');
    await file.writeAsBytes(params);
    return const Right(true);
  }
}
