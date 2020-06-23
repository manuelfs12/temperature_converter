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

  int input;
  String output;
  TextEditingController inputController;

  tempConverter(String input, String degree) {
    output = (int.parse(input) + 273.15).toString();
    print(output);
    return output;
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
                    output = tempConverter(text, 'c');
                  });
                },
              ),
            ),
            Text(output??'default')

          ],
        ),
      ),
    );
  }
}

