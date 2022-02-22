import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({Key? key, required this.img, required this.name, required this.species, required this.status, required this.gender}) : super(key: key);
  final String img;
  final String name;
  final String species;
  final String status;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: Colors.white),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: img,
            height: 100,
            
            width: 100,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(width: 15),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Text("Name: $name"),
          Text("Status: $status"),
          Text("Gender: $gender"),
          Text("Species: $species"),
          ],)
        ],
      ),
    );
  }
}
