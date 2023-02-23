import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  var topMovement = false;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    Future.delayed(const Duration(milliseconds: 800))
        .then((value) => {topMovement = true});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            top: topMovement ? 0 : width / 2,
            duration: controller.duration!,
            width: 400,
            child: Image.asset('assets/images/logo.png'),
          ),
        ],
      ),
    );
  }
}
