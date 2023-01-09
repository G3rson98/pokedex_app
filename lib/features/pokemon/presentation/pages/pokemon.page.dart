import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/style/text_style.dart';
import '../../../../shared/widgets/custom_app_bar.widget.dart';
import '../../domain/entities/pokemon_response.entity.dart';
import '../bloc/get_one_pokemon/get_one_pokemon_bloc.dart';
import '../widgets/chip_attribute.widget.dart';

class PokemonPage extends StatefulWidget {
  final PokemonResponse pokemon;
  const PokemonPage({
    super.key,
    required this.pokemon,
  });

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final GetOnePokemonBloc _pokemonBloc;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();
    // _pokemonBloc = PokemonInjection.sl.get<GetOnePokemonBloc>()
    //   ..add(const GetOnePokemon(name: 'bulbasaur'));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.pokemon.color.color,
      appBar: CustomAppBar(
        color: widget.pokemon.color.color,
        rightIcon: const Icon(Icons.heart_broken_outlined, color: Colors.white),
      ),
      body: Stack(
        children: [
          Positioned(
            right: -190,
            top: 0,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              },
              child: SvgPicture.asset(
                'assets/pokeball.svg',
                color: Colors.white.withOpacity(0.4),
                height: 400,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.pokemon.name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '#${widget.pokemon.order}',
                          style: Style.s18.bold?.apply(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: List.from(
                        widget.pokemon.types.map((e) => Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: ChipAttribute(text: e),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: DefaultTabController(
                    initialIndex: 1,
                    length: 4,
                    child: Column(
                      children: [
                        TabBar(
                          indicatorColor: widget.pokemon.color.color,
                          tabs: <Widget>[
                            Tab(
                              child: Text(
                                'About',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Stats',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Evolution',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Moves',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: <Widget>[
                              Center(
                                child: Text("It's cloudy here"),
                              ),
                              Center(
                                child: Text("It's rainy here"),
                              ),
                              Center(
                                child: Text("It's sunny here"),
                              ),
                              Center(
                                child: Text("It's sunny here"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.network(
              widget.pokemon.urlImage,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
