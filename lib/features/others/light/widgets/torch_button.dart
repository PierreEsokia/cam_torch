import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/light_bloc.dart';

class TorchButton extends StatelessWidget {
  const TorchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      onPressed: () {
        context.read<LightBloc>().add(ToggleLightEvent());
      },
      icon: BlocBuilder<LightBloc, LightState>(
        builder: (context, state) => state.isLightUp
            ? const Icon(Icons.lightbulb_rounded)
            : const Icon(Icons.lightbulb_outline),
      ),
    );
  }
}
