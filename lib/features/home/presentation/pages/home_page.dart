import 'package:auto_route/auto_route.dart';
import 'package:cam_torch/features/home/presentation/bloc/home_bloc.dart';
import 'package:camera/camera.dart';
import 'package:cam_torch/features/others/light/widgets/torch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  static const String route = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        buildWhen: (previous, current) =>
            previous.isCameraOpen != current.isCameraOpen,
        builder: (context, state) {
          if (state.isCameraOpen) {
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
                      return CameraPreview(controller);
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeBloc>().add(RequestCameraPermissionEvent());
        },
        child: const Icon(
          Icons.camera_alt,
        ),
      ),
    );
  }
}
