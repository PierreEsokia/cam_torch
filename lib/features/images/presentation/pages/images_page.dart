import 'package:auto_route/annotations.dart';
import 'package:cam_torch/features/images/presentation/bloc/images_bloc.dart';
import 'package:cam_torch/features/others/light/widgets/torch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ImagesPage extends StatefulWidget {
  static const String route = '/images';

  const ImagesPage({super.key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  @override
  void initState() {
    super.initState();
    context.read<ImagesBloc>().add(LoadImagesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rapport'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: const [
          TorchButton(),
        ],
      ),
      body: BlocBuilder<ImagesBloc, ImagesState>(
        buildWhen: (previous, current) => previous.images != current.images,
        builder: (context, state) {
          if (state is LoadingImagesState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FailedLoadImagesState) {
            return const Center(
              child: Text(
                'Erreur lors du chargement des images',
              ),
            );
          }
          state as LoadedImagesState;
          return GridView.builder(
            itemCount: state.images?.length ?? 0,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemBuilder: (context, index) {
              final file = state.images![index];
              return Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  PopupMenuButton(
                    onSelected: (value) {
                      if (value == 1) {
                        context.read<ImagesBloc>().add(DeleteImageEvent(
                              image: file,
                            ));
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 1,
                        child: Text(
                          'Supprimer',
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: Image.file(file),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
