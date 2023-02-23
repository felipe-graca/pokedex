import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  Future<void> init() async {
    Future.delayed(const Duration(milliseconds: 800)).then(
      (value) => {
        emit(
          state.copyWith(
            topMovement: true,
            visible: true,
          ),
        ),
      },
    );
  }
}
