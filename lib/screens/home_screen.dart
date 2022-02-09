import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Třetí lekce"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: () {}, child: const Text("NoteScreen")),
            TextButton(onPressed: () {}, child: const Text("ToDoScreen")),
            TextButton(onPressed: () {}, child: const Text("TimerScreen")),
          ],
        ),
      ),
    );
  }
}