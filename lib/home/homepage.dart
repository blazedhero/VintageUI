import 'package:flutter/material.dart';
import 'package:vintageui/categories/cat_categories.dart';
import 'package:vintageui/pages/chat_pet_page.dart';
import 'package:vintageui/pages/pet_page.dart';
import 'package:vintageui/pages/profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  List<Widget> widgets = [
    PetHomePage(),
    ChatPet(),
    CatCategories(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              child: widgets.elementAt(_index),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 20,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(12.5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BottomNavigationBar(
                    currentIndex: _index,
                    onTap: (int newIndex) {
                      setState(() {
                        _index = newIndex;
                      });
                    },
                    selectedFontSize: 10,
                    unselectedFontSize: 10,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.green.shade700,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.white,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.message), label: 'Message'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.category_sharp), label: 'List'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.account_box), label: 'Account'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
