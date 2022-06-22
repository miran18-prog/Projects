// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Login Page",
                style: GoogleFonts.bebasNeue(
                    fontSize: 40, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 50,
            ),
            Text("Please login or create an account to continue",
                style: GoogleFonts.bebasNeue(
                    fontSize: 20, fontWeight: FontWeight.w100)),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Enter Your Email",
                    icon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    )),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                toolbarOptions: ToolbarOptions(
                    copy: true, paste: true, cut: true, selectAll: true),
                obscureText: false,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Enter Your Password",
                    icon: Icon(
                      Icons.password,
                      color: Colors.grey,
                    )),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.login),
                label: Text("Login")),
          ]),
        ),
      ),
    ));
  }
}
