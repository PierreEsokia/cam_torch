import 'package:auto_route/annotations.dart';
import 'package:cam_torch/features/others/light/widgets/torch_button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ImagesPage extends StatefulWidget {
  static const String route = '/images';

  const ImagesPage({super.key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rapport'),
        actions: const [
          TorchButton()
        ],
      ),
    );
  }
}
