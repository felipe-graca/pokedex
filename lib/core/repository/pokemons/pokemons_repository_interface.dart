import 'package:pockdex/core/models/pokemons_model.dart';

abstract class IPokemonsRepository {
  Future<Pokemons> getAllPokemons();
}
