import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../usecase/toggle_torch_use_case.dart';

part 'light_event.dart';

part 'light_state.dart';

class LightBloc extends Bloc<LightEvent, LightState> {
  LightBloc(this.toggleTorchUseCase) : super(const LightInitial()) {
    on<ToggleLightEvent>(_onToggleTorch);
  }

  final ToggleTorchUseCase toggleTorchUseCase;

  Future<void> _onToggleTorch(
      ToggleLightEvent event, Emitter<LightState> emit) async {
    final res = await toggleTorchUseCase(state.isLightUp);
    res.fold(
      (l) => emit(
        state.copyWith(
          isError: true,
        ),
      ),
      (r) => emit(
        state.toggleLight(),
      ),
    );
  }
}
