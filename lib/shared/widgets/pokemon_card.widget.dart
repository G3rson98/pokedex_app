import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_response.entity.dart';
import 'package:pokemon_app/features/pokemon/presentation/pages/pokemon.page.dart';
import 'package:pokemon_app/features/pokemon/presentation/widgets/chip_attribute.widget.dart';
import 'package:pokemon_app/shared/style/text_style.dart';

class PokemonCard extends StatelessWidget {
  final PokemonResponse pokemon;

  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => PokemonPage(pokemon: pokemon),
        ),
      ),
      child: Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: pokemon.color.color,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 80,
              child: SvgPicture.asset(
                'assets/pokeball.svg',
                color: Colors.white.withOpacity(0.4),
                height: 150,
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "# ${pokemon.order}",
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...List.from(
                      pokemon.types.map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ChipAttribute(text: e),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      pokemon.name,
                      style: Style.s20.bold?.apply(color: Colors.white),
                    ),
                  ),
                ),
                const Spacer(),
                Image.network(
                  pokemon.urlImage,
                  height: 100,
                ),
                const SizedBox(
                  width: 18,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
