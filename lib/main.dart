import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pockdex/core/routes/app_router.dart';

import 'core/bloc/service_locator.dart';

Future<void> initializeServices() async {
  //initialize service injection
  await ServiceLocator.setup();

  //initialize getIt
  await GetIt.I.allReady();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    FutureBuilder(
      future: initializeServices(),
      builder: (_, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Container(),
          );
        }
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PokeDex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
