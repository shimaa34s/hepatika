import 'package:flutter/material.dart';

class patient_med extends StatefulWidget {
  const patient_med({Key? key}) : super(key: key);

  @override
  State<patient_med> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<patient_med> {
  final List<Map<String, dynamic>> _allUsers = [
    {
      "name": "vitaminE        9:00AM",
      "des": "Cholecalcaiferol , twice daily ",
    },
    {
      "name": "VitaminD3   11:00AM",
      "des": "Cholecalcaiferol , twice daily ",
    },
    {
      "name": "Zytrec          11:00AM",
      "des": "cetrizin10mg,1pill before sleep ",
    },
    {
      "name": "Gynera           2:00PM",
      "des": "Gestodene0.075mg, once daily ",
    },
    {
      "name": "OmegaPlus  9:00AM",
      "des": "Omega3, once daily after mail ",
    }
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            width: 500,
            color: Color(0xFFC9EEFF),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    "images/p1.jpg",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Hi,Nawal",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "We are here for your",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                " medicine",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF008CB6)),
              ),
              Text(
                " daily reminder",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) => _runFilter(value),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              hintText: "Search medication",
              prefixIcon: const Icon(Icons.search),
              // prefix: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dialydose today ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    wordSpacing: 200),
                textDirection: TextDirection.rtl,
              ),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.arrow_drop_down_circle),
            ],
          ),
          Expanded(

            child: _foundUsers.isNotEmpty
                ? ListView.builder(

                    itemCount: _foundUsers.length,
                    itemBuilder: (context, index) => Card(
                      elevation: 1,
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      child: ListTile(
                        title: Text(_foundUsers[index]['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                wordSpacing: 160)),
                        subtitle: Text(
                          '${_foundUsers[index]["des"]}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  )
                :  Text(
                    'No results found Please try with diffrent search',
                    style: TextStyle(fontSize: 24),
                  ),
          ),
        ],
      ),
    );
  }
}
