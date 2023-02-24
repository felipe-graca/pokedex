import 'dart:convert';

import 'package:pockdex/core/models/pokemons_model.dart';
import 'package:pockdex/core/repository/pokemons/pokemons_repository_interface.dart';
import 'package:pockdex/core/services/http_service/http_service_interface.dart';

class PokemonsRepository implements IPokemonsRepository {
  final IHttpService _httpService;

  PokemonsRepository(this._httpService);

  @override
  Future<Pokemons> getAllPokemons() async {
    final restult = await _httpService.get(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');

    return Pokemons.fromJson(json.decode(restult.data));
  }
}
