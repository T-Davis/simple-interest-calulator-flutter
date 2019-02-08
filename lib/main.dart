import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Interest Calculator',
      home: SIForm(),
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.green,
      ),
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
  var _currentItemSelected = 'Dollars';
  var _formKey = GlobalKey();
  var principalController = TextEditingController();
  var roiController = TextEditingController();
  var termController = TextEditingController();
  var displayResult = '';

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
      body: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.all(_minimumPadding * 2),
            child: ListView(
              children: <Widget>[
                getBankImage(),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: _principalController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter amount';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a number';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Principal',
                          hintText: 'Enter initial investment e.g. 12000',
                          labelStyle: textStyle,
                          errorStyle: TextStyle(
                              color: Colors.deepOrangeAccent, fontSize: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.deepOrangeAccent))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: roiController,
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
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: textStyle,
                          controller: _termController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter amount';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter a number';
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'Term',
                              hintText: 'Time in years',
                              labelStyle: textStyle,
                              errorStyle: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 15.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepOrangeAccent))),
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
                        value: _currentItemSelected,
                        onChanged: (String newValueSelected) {
                          _onDropDownItemSelected(newValueSelected);
                        },
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
                              child: Text('Calculate',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: textStyle.fontSize,
                                      fontWeight: FontWeight.bold)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              color: Colors.green,
                              onPressed: () {
                                setState(() {
                                  if (_formKey.currentState.validate()) {
                                    _displayResult = _calculateTotalReturns();
                                  }
                                });
                              }),
                        ),
                        Container(
                          width: _minimumPadding,
                        ),
                        Expanded(
                            child: RaisedButton(
                                child: Text('Reset',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: textStyle.fontSize,
                                        fontWeight: FontWeight.bold)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                color: Colors.green,
                                onPressed: () {
                                  setState(() {
                                    reset();
                                  });
                                }))
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(_minimumPadding * 2),
                  child: Text(_displayResult, style: textStyle),
                )
              ],
            )),
      ),
    );
  }

  getBankImage() =>
      Container(
        child: Image(
          image: AssetImage('images/bank.png'),
          width: 125.0,
          height: 125.0,
        ),
        margin: EdgeInsets.all(_minimumPadding * 10),
      );

  _onDropDownItemSelected(String value) =>
      setState(() {
        _currentItemSelected = value;
      });

  _calculateTotalReturns() {
    var principal = double.parse(principalController.text);
    var roi = double.parse(roiController.text);
    var term = double.parse(termController.text);

    var totalAmountPayable = principal + (principal * roi * term) / 100;

    return 'After $term years, your investment will be worth \$$totalAmountPayable $_currentItemSelected';
  }

  reset() {
    _formKey.currentState.reset();
    _principalController.text = '';
    _yearlyAddController.text = '';
    _roiController.text = '';
    _reinvestInterest = false;
    _termController.text = '';
    _displayResult = '';
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
