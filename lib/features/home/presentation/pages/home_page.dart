import 'package:auto_route/auto_route.dart';
import 'package:cam_torch/core/utils/app_router.dart';
import 'package:cam_torch/features/others/light/widgets/torch_button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  static const String route = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Accueil',
        ),
        actions: const [
          TorchButton()
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.router.push(const ImagesRoute());
          },
          child: const Text('Rapport'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
