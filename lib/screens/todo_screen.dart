import 'package:flutter/material.dart';
import 'package:treti_lekce/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/checkbox.dart';
import '../widgets/todo_item.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}


class _TodoScreenState extends State<TodoScreen> {
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

  void prazdna() {
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
    Fluttertoast.showToast(msg: "Smazáno",);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              ElevatedButton(onPressed: delete, child: const Text("Smazat označené"),style: ElevatedButton.styleFrom(
                  primary: Colors.red
              ),),
              const SizedBox(width: 10,)
            ],
          )
        ],
        title: const Text("TodoScreen"),
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

                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/20*15,
                            height: 90,
                            child:TextField(
                              decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  border: InputBorder.none),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: noteController,
                            ),
                          ),
                          Container(
                            width: 40,
                            child: TextButton(onPressed: save,
                              child: const Icon(Icons.add),),
                          )
                        ],
                      )
                    ),
                    Container(
                        height: 715,
                        child: ListView.separated(
                            separatorBuilder: (BuildContext context, int index) => Divider(
                              thickness: 1,
                            ),
                            itemCount: notes.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  //onLongPress: () => notes.removeAt(index),
                                title: Text(notes [index]),
                                  );
                              children: <Widget>[ //nefunguje!
                              TodoItem(title:"vec1")
                              ];
                            })
                    )
                  ],
                )
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}