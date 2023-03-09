import 'package:flutter/material.dart';
import 'package:vintageui/models/cats.dart';
import 'package:vintageui/models/pets.dart';

class PetHomePage extends StatefulWidget {
  const PetHomePage({super.key});

  @override
  State<PetHomePage> createState() => _PetHomePageState();
}

class _PetHomePageState extends State<PetHomePage> {
  final List<PetCategories> categories = CategoriesList;
  final List<PetCats> pets = PetCatsList;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  petAppBar(),
                  const SizedBox(
                    height: 31,
                  ),
                  PetSearchBoxShadow(),
                  categoryTitles("Pet Category"),
                  SizedBox(
                    height: 220,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 2),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return petCategories(index);
                      },
                    ),
                  ),
                  categoryTitles("New Pets"),
                  SizedBox(
                    height: 210,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 2),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return newPets(index);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            petSearchContainer(),
          ],
        ),
      ),
    );
  }

  Widget newPets(int index) => Stack(
        children: [
          Positioned(
            top: 12,
            left: 28,
            child: Transform(
              transform: Matrix4.rotationZ(pets[index].rotation),
              child: Container(
                height: 190,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Positioned(
            top: 6,
            left: 22,
            child: Transform(
              transform: Matrix4.rotationZ(pets[index].rotation),
              child: Container(
                height: 190,
                width: 160,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: pets[index].color,
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: newPetDetails(index),
              ),
            ),
          ),
        ],
      );

  Widget newPetDetails(int index) {
    final pet = pets[index];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage("assets/${pet.image}"),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              pet.location,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(20),
                  right: Radius.circular(20),
                ),
              ),
              child: Text(
                pet.breedFor,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Text(
          pet.breed,
          style: TextStyle(
            fontSize: 12.8,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 2,
        )
      ],
    );
  }

  Widget petCategories(int index) {
    final category = categories[index];
    return Transform(
      transform: Matrix4.rotationZ(category.rotate),
      child: Container(
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        padding: const EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.5, color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: category.color,
                border: Border.all(width: 1, color: Colors.black),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.pets,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Total ${category.total}",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade700,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryTitles(String title) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          const Icon(Icons.more_horiz),
        ],
      );

  Widget petSearchContainer() => Positioned(
        top: 84,
        right: 54,
        child: Container(
          height: 50,
          width: 310,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: Colors.black,
            ),
          ),
          child: const TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: 'Search Pets',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: InputBorder.none),
          ),
        ),
      );

  Widget PetSearchBoxShadow() => Container(
        height: 50,
        width: 310,
        decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Colors.black)),
      );

  Widget petAppBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.red,
            radius: 21,
          ),
          Row(
            children: [
              const Icon(Icons.notification_add_outlined),
              const Icon(Icons.bolt_outlined),
              const Icon(Icons.dashboard_outlined)
            ],
          ),
        ],
      );
}
