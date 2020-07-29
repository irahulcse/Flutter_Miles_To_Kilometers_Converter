import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _numberFrom;
  String _startMeasure;
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
  @override
  void initState() {
    // TODO: implement initState
    _numberFrom = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sizeX = MediaQuery.of(context).size.width;
    double sizeY = MediaQuery.of(context).size.height;
    final spacer = Padding(padding: EdgeInsets.only(bottom: sizeY / 40));
    // double x = MediaQuery.of(context).size.height;
    // final spacer = Padding(padding: EdgeInsets.only(bottom: x / 40));
    final TextStyle inputStyle = TextStyle(
      fontSize: 20,
      color: Colors.blue[900],
    );
    final TextStyle labelStyle = TextStyle(
      fontSize: 24,
      color: Colors.grey[700],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Converter Application"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            spacer,
            Text("Value", style: inputStyle),
            // spacer,
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Please enter the Miles you want to convert",
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
            spacer,
            Text((_numberFrom == null) ? ' ' : _numberFrom.toString()),
            spacer,
            Text(
              "From",
              style: labelStyle,
            ),
            DropdownButton(
              isExpanded: true,
              value: _startMeasure,
              items: _measures.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: inputStyle),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _startMeasure = value;
                });
              },
            ),
            spacer,
            Text(
              "To 2",
              style: labelStyle,
            ),
            DropdownButton(
              isExpanded: true,
              value: _startMeasure,
              items: _measures.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: inputStyle),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _startMeasure = value;
                });
              },
            ),
            spacer,
          ],
        ),
      ),
    );
  }
}
