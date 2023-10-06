part of 'home_bloc.dart';

enum HomeStatus { none, take, save }

class HomeState extends Equatable {
  final HomeStatus status;
  final XFile? image;

  const HomeState({
    required this.status,
    this.image,
  });

  @override
  List<Object?> get props => [status, image];

  HomeState copyWith({
    HomeStatus? status,
    XFile? image,
  }) {
    return HomeState(
      status: status ?? this.status,
      image: image ?? this.image,
    );
  }
}

class InitialState extends HomeState {
  const InitialState({
    super.status = HomeStatus.none,
  });
}
