import 'package:flutter/material.dart';

class PetCategories {
  final String pets;
  final int total;
  final double rotate;
  final Color color;

  PetCategories({
    required this.color,
    required this.pets,
    required this.rotate,
    required this.total,
  });
}

final CategoriesList = [
  PetCategories(color: Colors.purple, pets: "Moose", rotate: -0.03, total: 12),
  PetCategories(
      color: Colors.red.shade300, pets: "Cats", rotate: -0.02, total: 21),
  PetCategories(
      color: Colors.pinkAccent, pets: "Donkeys", rotate: 0.03, total: 1),
  PetCategories(
      color: Colors.cyanAccent, pets: "Dogs", rotate: -0.01, total: 31),
];
