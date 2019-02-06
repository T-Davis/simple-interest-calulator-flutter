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
  final _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: Column(
          children: <Widget>[
            getBankImage(),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: textField('Principal', 'Enter Principal e.g. 12000')),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: textField('Rate of Interest', 'In percent')),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: textField('Term', 'Time in years'),
                  ),
                  Container(
                    width: _minimumPadding * 5,
                  ),
                  Expanded(
                      child: DropdownButton<String>(
                        items: _currencies.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: 'Dollars',
                        onChanged: (String newValueSelected) {},
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getBankImage() =>
      Container(
        child: Image(
          image: AssetImage('images/bank.png'),
          width: 125.0,
          height: 125.0,
        ),
        margin: EdgeInsets.all(_minimumPadding * 10),
      );

  Widget textField(String label, String hint) =>
      TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      );
}
