import 'package:cam_torch/core/injections/injections.dart';
import 'package:cam_torch/core/utils/app_router.dart';
import 'package:cam_torch/features/home/presentation/bloc/home_bloc.dart';
import 'package:cam_torch/features/others/light/bloc/light_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await inject();
  runApp(
    App(
      appRouter: AppRouter(),
    ),
  );
}

class App extends StatelessWidget {
  const App({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<LightBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'TorchCam',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        routerConfig: appRouter.config(),
      ),
    );
  }
}
