part of 'home_bloc.dart';

class HomeState extends Equatable {

  final bool isCameraOpen;

  const HomeState({
    required this.isCameraOpen,
  });

  @override
  List<Object> get props => [isCameraOpen];

  HomeState copyWith({
    bool? isCameraOpen,
  }) {
    return HomeState(
      isCameraOpen: isCameraOpen ?? this.isCameraOpen,
    );
  }
}

class HomeInitial extends HomeState {
  const HomeInitial({super.isCameraOpen = false});
}
