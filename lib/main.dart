import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Interest Calculator',
      home: SIForm(),
      theme: ThemeData(
          primaryColor: Colors.green, accentColor: Colors.greenAccent),
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
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .subhead;

    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            getBankImage(),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  decoration: InputDecoration(
                      labelText: 'Principal',
                      hintText: 'Enter Principal e.g. 12000',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  decoration: InputDecoration(
                      labelText: 'Rate of Interest',
                      hintText: 'In percent',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      decoration: InputDecoration(
                          labelText: 'Term',
                          hintText: 'Time in years',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
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
            ),
            Padding(
                padding: EdgeInsets.only(
                    bottom: _minimumPadding, top: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                          child: Text('Calculate', style: textStyle),
                          onPressed: () {}),
                    ), Container(width: _minimumPadding,),
                    Expanded(
                        child: RaisedButton(
                            child: Text('Reset', style: textStyle),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            onPressed: () {}))
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text('Total Interest', style: textStyle),
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
}
