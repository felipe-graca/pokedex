import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pockdex/features/pages/splash_page/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  final splashCubit = GetIt.I.get<SplashCubit>();

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    splashCubit.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF77dd77),
      body: BlocBuilder<SplashCubit, SplashState>(
        bloc: splashCubit,
        builder: (context, state) {
          return SizedBox(
            width: width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  top: state.topMovement ? 0 : width / 2,
                  duration: controller.duration!,
                  width: 400,
                  child: Image.asset('assets/images/logo.png'),
                ),
                Positioned(
                  bottom: 100,
                  child: AnimatedOpacity(
                    opacity: state.visible ? 1 : 0,
                    duration: controller.duration!,
                    child: Image.asset(
                      'assets/images/text_logo.png',
                      scale: 1.1,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
