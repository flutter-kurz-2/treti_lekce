import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}



class _NoteScreenState extends State<NoteScreen> {
  TextEditingController noteController = TextEditingController();
  String noteText = "";
  void save() {
    setState(() {
      noteText = noteController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NoteScreen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              margin: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: TextField(
                  textAlign: TextAlign.center,
                  controller: noteController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder (
                          borderRadius: BorderRadius.circular(30)
                      )
                  )
              ),
            ),

            ElevatedButton(onPressed: save, child: const Text("Uložit")),

            const SizedBox(
              height: 40,
            ),

            Text(noteText,
            style: const TextStyle(fontSize: 23),)
          ],
        ),
      ),
    );
  }
}

