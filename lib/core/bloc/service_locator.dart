import 'package:get_it/get_it.dart';
import 'package:pockdex/core/repository/pokemons/pokemons_repository.dart';
import 'package:pockdex/core/repository/pokemons/pokemons_repository_interface.dart';
import 'package:pockdex/core/services/http_service/http_service_interface.dart';
import 'package:pockdex/core/services/http_service/http_servie.dart';
import 'package:pockdex/features/pages/home_page/home_cubit.dart';
import 'package:pockdex/features/pages/splash_page/splash_cubit.dart';

class ServiceLocator {
  static Future<void> setup() async {
    final i = GetIt.instance;

    //Services
    i.registerLazySingleton<IHttpService>(() => HttpService());

    //Repositorys
    i.registerLazySingleton<IPokemonsRepository>(
        () => PokemonsRepository(i.get()));

    //Pages
    i.registerLazySingleton(() => SplashCubit());
    i.registerLazySingleton(() => HomeCubit(i.get()));
  }
}
