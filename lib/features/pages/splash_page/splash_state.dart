part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final bool visible;
  final bool topMovement;

  const SplashState({
    this.visible = false,
    this.topMovement = false,
  });

  @override
  List<Object?> get props => [visible, topMovement];

  SplashState copyWith({
    bool? visible,
    bool? topMovement,
  }) {
    return SplashState(
      visible: visible ?? this.visible,
      topMovement: topMovement ?? this.topMovement,
    );
  }
}
