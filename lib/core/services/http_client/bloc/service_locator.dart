import 'package:get_it/get_it.dart';
import 'package:pockdex/features/pages/splash_page/splash_cubit.dart';

class ServiceLocator {
  static Future<void> setup() async {
    final i = GetIt.instance;

    i.registerLazySingleton(() => SplashCubit());
  }
}
