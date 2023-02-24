import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pockdex/core/models/pokemons_model.dart';
import 'package:pockdex/core/repository/pokemons/pokemons_repository_interface.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IPokemonsRepository pokemonsRepository;
  HomeCubit(this.pokemonsRepository) : super(const HomeState());

  Future<void> init() async {
    await getPokemons();
    emit(state.copyWith(
        showPokemons: [...state.allPokemons.take(state.showPokemonsAmount)]));
  }

  Future<bool> getPokemons() async {
    try {
      final result = await pokemonsRepository.getAllPokemons();
      emit(state.copyWith(allPokemons: result.pokemons));
      return true;
    } catch (_) {}
    return false;
  }
}
