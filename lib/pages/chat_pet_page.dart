import 'package:flutter/material.dart';

class ChatPet extends StatefulWidget {
  const ChatPet({super.key});

  @override
  State<ChatPet> createState() => _ChatPetState();
}

class _ChatPetState extends State<ChatPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text("Not Yet Done")),
    );
  }
}
