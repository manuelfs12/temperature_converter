import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TemperatureConverter(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();



}

class _TemperatureConverterState extends State<TemperatureConverter> {


  String output;
  String output2;
  TextEditingController inputController;

  void tempConverter(String input) {
    input = input.trim();
    String inputSubstring;

    for (var i = 0; i < input.length; i++) {
      inputSubstring = input[i].toUpperCase();
      if (inputSubstring.contains('C')) {
        print(input.substring(0, i));
        output = (double.parse(input.substring(0, i)) + 273.15).toString() + ' K';
        output2 = ((double.parse(input.substring(0, i)) * 9 / 5) + 32).toString() + ' F';
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Converter'),
        centerTitle: true,

      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: inputController,
                onSubmitted: (text) {
                  setState(() {
                    tempConverter(text);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                color: Theme.of(context).primaryColor,
                child: Text(
                  output ?? '0',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                color: Theme.of(context).primaryColor,
                child: Text(
                  output2 ?? '0',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

