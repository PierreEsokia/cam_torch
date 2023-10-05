part of 'light_bloc.dart';

class LightState extends Equatable {
  final bool isLightUp;
  final bool isError;

  const LightState({
    required this.isLightUp,
    required this.isError,
  });

  LightState copyWith({
    bool? isLightUp,
    bool? isError,
  }) {
    return LightState(
      isLightUp: isLightUp ?? this.isLightUp,
      isError: isError ?? this.isError,
    );
  }

  LightState toggleLight({
    bool? isError,
  }) {
    return LightState(
      isLightUp: !isLightUp,
      isError: isError ?? this.isError,
    );
  }

  @override
  List<Object> get props => [isLightUp, isError];
}

class LightInitial extends LightState {
  const LightInitial({
    super.isLightUp = false,
    super.isError = false,
  });
}
