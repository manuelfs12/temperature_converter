import 'package:flutter/material.dart';

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
        output = (double.parse(input.substring(0, i)) + 273.15).toStringAsFixed(2) + ' K';
        output2 = ((double.parse(input.substring(0, i)) * 9 / 5) + 32).toStringAsFixed(2) + ' F';
      } else if (inputSubstring.contains('F')) {
        output = ((double.parse(input.substring(0, i)) - 32) * 5 / 9 + 273.15).toStringAsFixed(2) + ' K';
        output2 = ((double.parse(input.substring(0, i)) - 32) * 5 / 9).toStringAsFixed(2) + ' C';
      } else if (inputSubstring.contains('K')) {
        output = (double.parse(input.substring(0, i)) - 273.15).toStringAsFixed(2) + ' C';
        output2 = ((double.parse(input.substring(0, i)) - 273.15) * 9 / 5 + 32).toStringAsFixed(2) + ' F';
      } else {
        output = 'Invalid input';
        output2 = output;
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
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Eg: 150C',
                  prefixIcon: Icon(Icons.ac_unit),
                  suffixIcon: Icon(Icons.ac_unit),
                ),
                controller: inputController,
                onSubmitted: (text) {
                  setState(() {
                    tempConverter(text);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                color: Theme.of(context).primaryColor,
                child: Text(
                  output ?? 'No input provided.',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                color: Theme.of(context).primaryColor,
                child: Text(
                  output2 ?? 'No input provided.',
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

