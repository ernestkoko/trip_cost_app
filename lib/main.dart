import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trip Cost Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  String result = '';
  final _currencies = ["Dollars", "Euro", "Pounds"];
  String _currency = "Dollars";
  final double _formDistance = 5.0;

  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    //setting style for this widget
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance,
              ),

              child: TextField(
                controller: distanceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Distance",
                  hintText: "e.g 1.65",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance,
              ),

              child: TextField(
                controller: avgController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Distance per Unit",
                  hintText: "e.g 123",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance,
              ),

              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: priceController ,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Price",
                        hintText: "e.g 123",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),

                    ),
                  ),
                  Container(
                    width: _formDistance * 5,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      items: _currencies.map(
                            (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      value: _currency,
                      onChanged: (String value) {
                        _onDropDownChanged(value);
                      },
                    ),
                  ),
                ],
              ),
            ),

            Row(
              children:<Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {

                      setState(() {
                        // result = distanceController.text;
                        result= _calculate();
                      });
                    },
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text(
                      "Submit",
                      textScaleFactor: 1.5,
                    ),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {

                     // setState(() {
                        // result = distanceController.text;
                         _reset();
                     // });
                    },
                    color: Theme.of(context).buttonColor,
                    textColor: Theme.of(context).primaryColorDark,
                    child: Text(
                      "Reset",
                      textScaleFactor: 1.5,
                    ),
                  ),
                ),
              ],
            ),

            Text(result),
          ],
        ),
      ),
    );
  }

  _onDropDownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }

  String  _calculate(){
    double _distance = double.parse(distanceController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consumption = double.parse(avgController.text);
    double _total = _distance/ _consumption * _fuelCost;
    String _result = "The total cost for your trip is: " + 
    _total.toStringAsFixed(2) + " "+ _currency;

    return _result;
  }

   _reset(){
    distanceController.text = '';
    priceController.text = '';
    avgController.text = '';
    setState(() {
      result  = '';
    });
  }
}
