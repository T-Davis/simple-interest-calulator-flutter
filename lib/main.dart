import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      title: 'Simple Interest Calculator',
      home: SIForm(),
    ));

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _currencies = ['Dollars', 'Pounds', 'Rupees'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
      ), body: Container(
      child: Column(children: <Widget>[
      ],),
    ),
    );
  }
}
