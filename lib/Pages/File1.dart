// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutterdesktop/DataFolder/Data.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentsHomeScreenView(),
    );
  }
}

class StudentsHomeScreenView extends StatefulWidget {
  const StudentsHomeScreenView({Key? key}) : super(key: key);

  @override
  State<StudentsHomeScreenView> createState() => _StudentsHomeScreenViewState();
}

class _StudentsHomeScreenViewState extends State<StudentsHomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "students list",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                listOfStudents.add(
                  ListOf(first_name: "test4", last_name: "test4"),
                );
                setState(() {});
              },
              icon: Icon(Icons.plus_one)),
          centerTitle: true,
          backgroundColor: Colors.grey,
          elevation: 0,
        ),
        body: Container(
          color: Colors.teal,
          child: ListView.builder(
              itemCount: listOfStudents.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    elevation: 0,
                    borderOnForeground: false,
                    child: ListTile(
                      title: Text(listOfStudents[i].first_name),
                      leading: Icon(Icons.person),
                      trailing: IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () {}),
                      subtitle: Text(i.toString()),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
