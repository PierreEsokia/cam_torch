import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'light_event.dart';

part 'light_state.dart';

class LightBloc extends Bloc<LightEvent, LightState> {
  LightBloc() : super(const LightInitial()) {
    on<ToggleLightEvent>(_onToggleTorch);
  }

  Future<void> _onToggleTorch(
      ToggleLightEvent event, Emitter<LightState> emit) async {
    emit(state.toggleLight());
  }
}
