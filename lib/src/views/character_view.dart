import 'package:flutter/material.dart';
import 'package:rickandmorty/src/view_model/home_view_model.dart';
import 'package:rickandmorty/src/views/character_card.dart';

class CharacterView extends StatelessWidget {
  const CharacterView({
    Key? key,
    required this.provider, required this.orientation,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.9,
  }) : super(key: key);

  final HomeViewModel provider;
  final Orientation orientation;
  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 15,
            childAspectRatio: childAspectRatio,
            mainAxisSpacing: 15),
        shrinkWrap: true,
        itemCount: provider.result.length,
        itemBuilder: (context, int index) {
          return CharacterCard(
              img: provider.result[index].image,
              name: provider.result[index].name,
              species: provider.result[index].species,
              status: provider.result[index].status,
              gender: provider.result[index].gender);
        });
  }
}
