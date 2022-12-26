import 'package:flutter/material.dart';
import 'package:football_app/baseUtils/colors.dart';


class User {
  final String name;
  final String rank;
  IconData icon;
  var image;

  User({this.name, this.rank,this.icon,this.image});
}

class TableScreen extends StatefulWidget {
  @override
  TableScreenState createState() => TableScreenState();
}

class TableScreenState extends State<TableScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController rankController = TextEditingController();

  final form = GlobalKey<FormState>();
  static var _focusNode = new FocusNode();
  bool update = false;
  int currentIndex = 0;

  List<User> userList = [
    User(name: " Arsenal", rank: "1",image:AssetImage("assets/images/square.png")),
    User(name: "Aston Villa", rank: "2",image:AssetImage("assets/images/square.png")),
    User(name: "Bournemouth", rank: "3",image:AssetImage("assets/images/square.png")),
    User(name: "Chelsea", rank: "4",image:AssetImage("assets/images/square.png")),
    User(name: "Everton", rank: "5",image:AssetImage("assets/images/square.png")),
    User(name: "Brentford", rank: "6",image:AssetImage("assets/images/square.png")),
    User(name: "Fulham", rank: "7",image:AssetImage("assets/images/square.png")),
    User(name: "Liverpool", rank: "8",image:AssetImage("assets/images/square.png")),
    User(name: "Manchester City", rank: "9",image:AssetImage("assets/images/square.png")),
  ];

  @override
  Widget build(BuildContext context) {
    Widget bodyData() => DataTable(
      onSelectAll: (b) {},
      sortColumnIndex: 0,
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(label: Text("Logo"), tooltip: "To Display logo"),
        DataColumn(label: Text("Name"), tooltip: "To Display name"),
        DataColumn(label: Text("Rank"), tooltip: "To Display rank"),
        DataColumn(label: Text("Update"), tooltip: "Update data"),
        DataColumn(label: Text("Delete"), tooltip: "Delete data"),
      ],
      rows: userList
          .map(
            (user) => DataRow(
          cells:[
              DataCell(Image(
                image: user.image,)),
            DataCell(
              Text(user.name),
            ),

            DataCell(
              Text(user.rank),
            ),
            DataCell(
              IconButton(
                onPressed: () {
                  currentIndex = userList.indexOf(user);
                  _updateTextControllers(user); // new function here
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    currentIndex = userList.indexOf(user);
                    _deleteTextControllers(); // new function here
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
          .toList(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Premier League"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            bodyData(),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: form,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: nameController,
                        focusNode: _focusNode,
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        decoration: new InputDecoration(
                          labelText: 'Name',
                          hintText: 'Name',
                          labelStyle: new TextStyle(
                              decorationStyle: TextDecorationStyle.solid),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: rankController,
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        decoration: new InputDecoration(
                            labelText: 'Rank',
                            hintText: 'Rank',
                            labelStyle: new TextStyle(
                                decorationStyle: TextDecorationStyle.solid)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextButton(
                                  child: Text("Add"),
                                  onPressed: () {
                                    if (validate() == true) {
                                      form.currentState.save();
                                      addUserToList(
                                        nameController.text,
                                        rankController.text,
                                      );
                                      clearForm();
                                    }
                                  },
                                ),
                                TextButton(
                                  child: Text("Update"),
                                  onPressed: () {
                                    if (validate() == true) {
                                      form.currentState.save();
                                      updateForm();
                                      clearForm();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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

  void updateForm() {
    setState(() {
      //Code to update the list after editing
      User user = User(name: nameController.text, rank: rankController.text);
      userList[currentIndex] = user;
    });
  }

  void _updateTextControllers(User user) {
    setState(() {
      nameController.text = user.name;
      rankController.text = user.rank;
    });
  }

  void _deleteTextControllers() {
    setState(() {
      //How to delete the list data on clicking Delete button?
      userList.removeAt(currentIndex);
    });
  }

  void addUserToList(name, rank) {
    setState(() {
      userList.add(User(name: name, rank: rank));
    });
  }

  clearForm() {
    nameController.clear();
    rankController.clear();
  }

  bool validate() {
    var valid = form.currentState.validate();
    if (valid) form.currentState.save();
    return valid;
  }
}