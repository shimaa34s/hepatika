import 'package:flutter/material.dart';

import '../curd.dart';
import '../date_time_manager.dart';
import '../note.dart';

class addMed extends StatefulWidget {
  const addMed({Key? key}) : super(key: key);

  @override
  State<addMed> createState() => _MyHomePageState();
}

String dropdownValue = '';

class _MyHomePageState extends State<addMed> {
  TextEditingController? _controller;

  TextEditingController? _updateController;

  GlobalKey<FormState>? _key;
  GlobalKey<FormState>? _updatedkey;

  @override
  void initState() {
    CURD.curd.init();
    _controller = TextEditingController();

    _key = GlobalKey();
    _updatedkey = GlobalKey();

    //viewNotes();
    super.initState();
  }

  void dispose() {
    _controller?.dispose();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 250,
              width: 500,
              color: Color(0xFFC9EEFF),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            "images/dr2.jpg",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Hi,Dr.Mostafa",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Nawal‘s ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF008CB6)),
                      ),
                      Text(
                        "prescribed medicines",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _key,
                      child: SizedBox(
                        width: 310,
                        child: TextFormField(
                          validator: (value) =>
                              value!.isEmpty ? 'This Field Is Required' : null,
                          controller: _controller,
                          decoration: InputDecoration(
                              // contentPadding: EdgeInsets.fromLTRB(10, 10, 70, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              prefixIcon: Icon(Icons.add),
                              labelText: 'Add medications'),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_key!.currentState!.validate()) {
                          Note _note = Note(
                              text: _controller!.value.text,
                              date: DateTimeManger.currentDate());
                          saveNote(_note);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF008CB6),
                        shape: CircleBorder(),
                      ),
                      child: Icon(Icons.add)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Dailydose today",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        wordSpacing: 150),
                    textDirection: TextDirection.rtl,
                  ),
                ),

                Icon(Icons.arrow_drop_down_circle),
                SizedBox(
                  height: 30,
                ),
                ButtonBar(
                  children: [],
                )
              ],
            ),
            Form(
              child: FutureBuilder(
                  future: viewNotes(),
                  builder: (context, AsyncSnapshot<List<Note>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => ListTile(
                              title: Column(
                                children: [
                                  Form(
                                    child: SizedBox(
                                      height: 70,
                                      width: 500,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            prefixIcon: Icon(
                                              Icons.remove_circle_outlined,
                                              color: Color(0xFF008CB6),
                                            ),
                                            labelText:
                                                snapshot.data![index].text!,
                                            labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              trailing: SizedBox(
                                width: 70,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: IconButton(
                                            onPressed: () => deleteSlectedNote(
                                                snapshot.data![index].id),
                                            icon: Icon(Icons.delete))),
                                    Expanded(
                                        child: IconButton(
                                            onPressed: () => showUpdatingDialog(
                                                snapshot.data![index]),
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 0, 0, 0),
                                            icon: Icon(Icons.edit))),
                                  ],
                                ),
                              )),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: snapshot.data!.length);
                    } else if (snapshot.hasError) {
                      return Text(
                        snapshot.error!.toString(),
                        style: TextStyle(color: Colors.red),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            )
          ],
        )),
      ),
    );
  }

  void saveNote(Note note) {
    CURD.curd.saveNote(note).then((row) {
      if (row > 0) {
        showSuccessMessage('1 row inserted');
        // viewNotes();
        _controller?.text = '';

        setState(() {});
      } else {
        showFailerMassege();
      }
    });
  }

  void showSuccessMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void showFailerMassege() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Error')));
  }

  /* void viewNotes() {
    CURD.curd.viewNotes().then((value) {
      setState(() {
        _notes =value;
      });
    });
  }*/
  Future<List<Note>> viewNotes() {
    return CURD.curd.viewNotes();
  }

  deleteSlectedNote(int? id) {
    CURD.curd.deleteNote(id).then((row) {
      if (row > 0) {
        showSuccessMessage('1 row deleted');
        // viewNotes();
        _controller?.text = '';

        setState(() {});
      } else {
        showFailerMassege();
      }
    });
  }

  showUpdatingDialog(Note note) {
    _updateController = TextEditingController(text: note.text);
    // _updateController1 = TextEditingController(text: note.text1);

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Update Medicine'),
              content: Wrap(
                children: [
                  Form(
                      key: _updatedkey,
                      child: TextFormField(
                        controller: _updateController,
                        //controller1: _updateController1,

                        validator: (value) =>
                            value!.isEmpty ? 'this field is required ' : null,
                        decoration: InputDecoration(labelText: 'Note'),
                      ))
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('cancel')),
                TextButton(
                    onPressed: () {
                      if (_updatedkey!.currentState!.validate()) {
                        note.text = _updateController!.value.text;
                        note.updateDate = DateTimeManger.currentDate();
                        updateSelectedNote(note);
                      }
                      Navigator.pop(context);
                    },
                    child: Text('update'))
              ],
            ));
  }

  updateSelectedNote(Note note) {
    CURD.curd.updateNote(note).then((row) {
      if (row > 0) {
        showSuccessMessage('1 row updata');
        // viewNotes();
        _updateController?.text = '';
        setState(() {});
      } else {
        showFailerMassege();
      }
    });
  }
}
