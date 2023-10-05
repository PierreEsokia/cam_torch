import 'package:cam_torch/features/home/domain/usecase/request_camera_permission_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.requestCameraPermissionUseCase) : super(const HomeInitial()) {
    on<RequestCameraPermissionEvent>(_onRequestCameraPermissionEvent);
  }

  final RequestCameraPermissionUseCase requestCameraPermissionUseCase;

  Future<void> _onRequestCameraPermissionEvent(
      RequestCameraPermissionEvent event, Emitter<HomeState> emit) async {
    final res = await requestCameraPermissionUseCase(null);
    res.fold(
      (l) => emit(
        state.copyWith(
          isCameraOpen: false,
        ),
      ),
      (r) => emit(
        state.copyWith(
          isCameraOpen: true,
        ),
      ),
    );
  }
}
