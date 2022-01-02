import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double? _numberFrom;
  String? _startMeasure;
  String? _convertMeasure;

  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  final TextStyle inputStyle = TextStyle(
    fontSize: 20,
    color: Colors.blue[900],
  );

  final TextStyle labelStyle = TextStyle(
    fontSize: 24,
    color: Colors.grey,
  );

  @override
  void initState() {
    _numberFrom = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(title: Text('Measures Converter'),),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Spacer(),
              Text(
                'Value',
                style: labelStyle,
              ),
              TextField(
                style: inputStyle,
                decoration: InputDecoration(
                  hintText: 'Please insert the measure value',
                ),
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  if (rv != null) {
                    setState(() {
                      _numberFrom = rv;
                    });
                  }
                },
              ),
              Spacer(),
              Text(
                'From',
                style: labelStyle,
              ),
              DropdownButton<String>(
                items: _measures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value, 
                    child: Text(value),);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _startMeasure = value;
                  });
                },
                value: _startMeasure,
              ),
              Spacer(),
              Text(
                'To',
                style: labelStyle,
              ),
              DropdownButton<String>(
                items: _measures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value, 
                    child: Text(value),);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _convertMeasure = value;
                  });
                },
                value: _convertMeasure,
              ),
              Spacer(flex: 2,),
              ElevatedButton(
                child: Text('Convert', style: inputStyle,),
                onPressed: () => true,
              ),
              Spacer(flex: 2,),
            ]),
        ),
      ),
    );
  }
}