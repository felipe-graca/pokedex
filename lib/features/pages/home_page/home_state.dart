part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<Pokemon> allPokemons;
  final List<Pokemon> showPokemons;
  final int showPokemonsAmount;
  final int actualShowPokemons;

  const HomeState({
    this.allPokemons = const [],
    this.showPokemons = const [],
    this.showPokemonsAmount = 21,
    this.actualShowPokemons = 21,
  });

  @override
  List<Object?> get props => [
        allPokemons,
        showPokemons,
        showPokemonsAmount,
        actualShowPokemons,
      ];

  HomeState copyWith({
    List<Pokemon>? allPokemons,
    List<Pokemon>? showPokemons,
    final int? showPokemonsAmount,
    final int? actualShowPokemons,
  }) {
    return HomeState(
      allPokemons: allPokemons ?? this.allPokemons,
      showPokemons: showPokemons ?? this.showPokemons,
      actualShowPokemons: actualShowPokemons ?? this.actualShowPokemons,
    );
  }
}
