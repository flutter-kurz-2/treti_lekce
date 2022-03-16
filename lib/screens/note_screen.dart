import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';



class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController noteController = TextEditingController();
  late SharedPreferences _prefs;
  bool loaded = false;
  List<String> notes = [];

  @override
  void initState(){
    super.initState();
    load();
  }

  void load() async {
    _prefs = await SharedPreferences.getInstance();
    notes = _prefs.getStringList("NOTES") ?? [];
    loaded = true;
    setState(() {});
  }

  void save() {
    Fluttertoast.showToast(msg: "Uloženo",);
    notes.add(noteController.text);
    noteController.text = "";
    _prefs.setStringList("NOTES", notes);
    setState(() {});
  }



  void delete() {
    notes.clear();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              ElevatedButton(onPressed: delete, child: const Text("Smazat"),style: ElevatedButton.styleFrom(
                primary: Colors.red
              ), ),
              const SizedBox(width: 10,)
            ],
          )
        ],
        title: const Text("NoteScreen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20,),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(
                    width: MediaQuery.of(context).size.width/20*19,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(20))
                    ),
                    child: Container(
                              width: MediaQuery.of(context).size.width/20*18,
                              child: TextField(
                                decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: noteController,
                              ),
                            ),
                    ), 
                  Container(
                    height: 700,
                    child: ListView.builder(
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(notes [index]),
                            );
                          })
                  )
                ],
              )
            ),
           const SizedBox(height: 20,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: save,
        child: const Icon(Icons.add), tooltip: "Vytvořit novou poznámku",),
    );
  }
}
