import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/features/pokemon/presentation/bloc/list_pokemon/list_pokemon_bloc.dart';
import 'package:pokemon_app/shared/injections/pokemon_injection.dart';
import 'package:pokemon_app/shared/widgets/pokemon_card.widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final ListPokemonBloc _listPokemonBloc;
  final _scrollController = ScrollController();

  @override
  void initState() {
    _listPokemonBloc = PokemonInjection.sl.get<ListPokemonBloc>()
      ..add(const ListPokemon());
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _listPokemonBloc.close();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) _listPokemonBloc.add(const ListPokemon());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.99);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Dexter la Pokedex',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: BlocBuilder<ListPokemonBloc, ListPokemonState>(
              bloc: _listPokemonBloc,
              builder: (context, state) {
                if (state is ListPokemonInitial) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: state.pokemons.length,
                  controller: _scrollController,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: PokemonCard(
                        pokemon: state.pokemons[index],
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
