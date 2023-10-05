part of 'light_bloc.dart';


abstract class LightEvent extends Equatable {
  const LightEvent();
}

class ToggleLightEvent extends LightEvent {
  @override
  List<Object?> get props => [];
}


