import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cam_torch/core/utils/app_router.dart';
import 'package:cam_torch/features/home/presentation/bloc/home_bloc.dart';
import 'package:camera/camera.dart';
import 'package:cam_torch/features/others/light/widgets/torch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_painter/image_painter.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  static const String route = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CameraController controller;
  final _imageKey = GlobalKey<ImagePainterState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Accueil',
        ),
        actions: const [
          TorchButton(),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          if (state.status == HomeStatus.take) {
            return FutureBuilder<List<CameraDescription>>(
              future: availableCameras(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  controller = CameraController(
                    snapshot.data![1],
                    ResolutionPreset.max,
                  );
                  return FutureBuilder(
                    future: controller.initialize(),
                    builder: (context, snap) {
                      if (!controller.value.isInitialized)
                        return const SizedBox.shrink();
                      return Column(
                        children: [
                          const Spacer(),
                          CameraPreview(controller),
                        ],
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          } else if (state.status == HomeStatus.save) {
            return ImagePainter.file(
              File(state.image!.path),
              key: _imageKey,
            );
          }
          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.router.push(const ImagesRoute());
              },
              child: const Text('Rapport'),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (homeBloc.state.status == HomeStatus.take) {
            homeBloc.add(TakePictureEvent(controller: controller));
          } else if (homeBloc.state.status == HomeStatus.none) {
            homeBloc.add(RequestCameraPermissionEvent());
          } else if (homeBloc.state.status == HomeStatus.save) {
            final rawImage = await _imageKey.currentState?.exportImage();
            if (rawImage != null) {
              homeBloc.add(SavePictureEvent(
                image: rawImage,
              ));
            }
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            switch (state.status) {
              case HomeStatus.none:
                return const Icon(
                  Icons.camera_outlined,
                );
              case HomeStatus.take:
                return const Icon(
                  Icons.camera_alt_outlined,
                );
              case HomeStatus.save:
                return const Icon(
                  Icons.save_outlined,
                );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
