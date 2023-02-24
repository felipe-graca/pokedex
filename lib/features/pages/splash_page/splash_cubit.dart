import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pockdex/core/routes/app_router.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  Future<void> init({required BuildContext context}) async {
    Future.delayed(const Duration(milliseconds: 800)).then(
      (value) => {
        emit(
          state.copyWith(
            topMovement: true,
            visible: true,
          ),
        ),
        Future.delayed(const Duration(seconds: 1))
            .then((value) => Navigator.pushNamed(context, AppRouter.home))
      },
    );
  }
}
