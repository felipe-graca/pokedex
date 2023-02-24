import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pockdex/features/pages/home_page/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeCubit = GetIt.I.get<HomeCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: homeCubit,
        builder: (context, state) {
          return Column(
            children: [
              Container(
                height: 100,
                color: const Color(0XFFf6b26b),
                child: SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                      const SizedBox(width: 10),
                      const Text("Procurar")
                    ],
                  ),
                )),
              ),
              Flexible(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    FutureBuilder(
                      future: homeCubit.getPokemons(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            cacheExtent: 100,
                            shrinkWrap: true,
                            itemCount: state.allPokemons.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 20,
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    width: 140,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        222,
                                        222,
                                        223,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          offset: const Offset(0, 0),
                                          blurRadius: 10,
                                        )
                                      ],
                                    ),
                                    child: Image.network(
                                      state.allPokemons[index].img!,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(state.allPokemons[index].name!),
                                ],
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
