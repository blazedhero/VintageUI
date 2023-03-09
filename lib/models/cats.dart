// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PetCats {
  final String breed, location, breedFor, image;
  final Color color;
  final double rotation;

  PetCats({
    required this.image,
    required this.color,
    required this.rotation,
    required this.breed,
    required this.breedFor,
    required this.location,
  });
}

final PetCatsList = [
  PetCats(
      image: "assets/img2.jpg",
      color: Colors.yellow.shade300,
      rotation: 0.04,
      breed: "German Cat",
      breedFor: "Adoption",
      location: "Mexico"),
  PetCats(
      image: "assets/img2.jpg",
      color: Colors.red.shade300,
      rotation: -0.04,
      breed: "Dog",
      breedFor: "Adoption",
      location: "Asia"),
  PetCats(
      image: "assets/img3.jpg",
      color: Colors.green.shade300,
      rotation: 0.04,
      breed: "Donkey",
      breedFor: "Adoption",
      location: "California"),
  PetCats(
      image: "assets/img3.jpg",
      color: Colors.purple.shade300,
      rotation: 0.04,
      breed: "Tiger",
      breedFor: "Adoption",
      location: "USA"),
];
