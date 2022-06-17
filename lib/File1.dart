// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      home: Calculator(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String expression = "";
  String Equation = "0";
  String Result = "0";
  ButtonPessed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        Equation = "0";
        Result = "0";
      } else if (buttonText == "⌫") {
        Equation = Equation.substring(0, Equation.length - 1);
        if (Equation == "") Equation = "0";
      } else if (buttonText == "=") {
        expression = Equation;
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          Result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {}
      } else {
        if (Equation == "0")
          Equation = buttonText;
        else
          Equation = Equation + buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
            child: Text(
              Equation,
              style: TextStyle(fontSize: 38),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
            child: Text(
              Result,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    TableRow(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Button("C", 1, Colors.redAccent),
                        Button("⌫", 1, Colors.redAccent),
                        Button("/", 1, Colors.redAccent),
                      ],
                    ),
                    TableRow(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Button("7", 1, Colors.blueAccent),
                        Button("8", 1, Colors.blueAccent),
                        Button("9", 1, Colors.blueAccent),
                      ],
                    ),
                    TableRow(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Button("4", 1, Colors.blueAccent),
                        Button("5", 1, Colors.blueAccent),
                        Button("6", 1, Colors.blueAccent),
                      ],
                    ),
                    TableRow(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Button("1", 1, Colors.blueAccent),
                        Button("2", 1, Colors.blueAccent),
                        Button("3", 1, Colors.blueAccent),
                      ],
                    ),
                    TableRow(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Button(".", 1, Colors.blueAccent),
                        Button("0", 1, Colors.blueAccent),
                        Button("00", 1, Colors.blueAccent),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Button("*", 1, Colors.cyan),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button("-", 1, Colors.cyan),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button("+", 1, Colors.cyan),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button("=", 2, Colors.cyan),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget Button(String ButtonText, double Buttonheight, Color ButtonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * Buttonheight,
      color: ButtonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid)),
        onPressed: () => ButtonPessed(ButtonText),
        child: Text(
          ButtonText,
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
