class Pokemons {
  final List<Pokemon>? pokemons;

  Pokemons({
    this.pokemons,
  });

  Pokemons copyWith({
    List<Pokemon>? pokemons,
  }) {
    return Pokemons(
      pokemons: pokemons ?? this.pokemons,
    );
  }

  Pokemons.fromJson(Map<String, dynamic> json)
      : pokemons = (json['pokemon'] as List?)
            ?.map((dynamic e) => Pokemon.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'pokemons': pokemons?.map((e) => e.toJson()).toList()};
}

class Pokemon {
  final int? id;
  final String? num;
  final String? name;
  final String? img;
  final List<String>? type;
  final String? height;
  final String? weight;
  final String? candy;
  final int? candyCount;
  final String? egg;
  final String? spawnTime;
  final List<double>? multipliers;
  final List<String>? weaknesses;
  final List<NextEvolution>? nextEvolution;

  Pokemon({
    this.id,
    this.num,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    this.candyCount,
    this.egg,
    this.spawnTime,
    this.multipliers,
    this.weaknesses,
    this.nextEvolution,
  });

  Pokemon copyWith({
    int? id,
    String? num,
    String? name,
    String? img,
    List<String>? type,
    String? height,
    String? weight,
    String? candy,
    int? candyCount,
    String? egg,
    String? spawnTime,
    List<double>? multipliers,
    List<String>? weaknesses,
    List<NextEvolution>? nextEvolution,
  }) {
    return Pokemon(
      id: id ?? this.id,
      num: num ?? this.num,
      name: name ?? this.name,
      img: img ?? this.img,
      type: type ?? this.type,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      candy: candy ?? this.candy,
      candyCount: candyCount ?? this.candyCount,
      egg: egg ?? this.egg,
      spawnTime: spawnTime ?? this.spawnTime,
      multipliers: multipliers ?? this.multipliers,
      weaknesses: weaknesses ?? this.weaknesses,
      nextEvolution: nextEvolution ?? this.nextEvolution,
    );
  }

  Pokemon.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        num = json['num'] as String?,
        name = json['name'] as String?,
        img = json['img'] as String?,
        type =
            (json['type'] as List?)?.map((dynamic e) => e as String).toList(),
        height = json['height'] as String?,
        weight = json['weight'] as String?,
        candy = json['candy'] as String?,
        candyCount = json['candy_count'] as int?,
        egg = json['egg'] as String?,
        spawnTime = json['spawn_time'] as String?,
        multipliers = (json['multipliers'] as List?)
            ?.map((dynamic e) => e as double)
            .toList(),
        weaknesses = (json['weaknesses'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        nextEvolution = (json['next_evolution'] as List?)
            ?.map((dynamic e) =>
                NextEvolution.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'num': num,
        'name': name,
        'img': img,
        'type': type,
        'height': height,
        'weight': weight,
        'candy': candy,
        'candy_count': candyCount,
        'egg': egg,
        'spawn_time': spawnTime,
        'multipliers': multipliers,
        'weaknesses': weaknesses,
        'next_evolution': nextEvolution?.map((e) => e.toJson()).toList()
      };
}

class NextEvolution {
  final String? num;
  final String? name;

  NextEvolution({
    this.num,
    this.name,
  });

  NextEvolution copyWith({
    String? num,
    String? name,
  }) {
    return NextEvolution(
      num: num ?? this.num,
      name: name ?? this.name,
    );
  }

  NextEvolution.fromJson(Map<String, dynamic> json)
      : num = json['num'] as String?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'num': num, 'name': name};
}
