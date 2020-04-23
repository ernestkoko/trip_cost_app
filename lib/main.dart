import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello You',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HelloYou(),
    );
  }
}

class HelloYou extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HelloYou();

}

class _HelloYou extends State<HelloYou>{
  String name = '';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "Please Insert Your Name",
              ),
              onChanged: (String string ){
                setState(() {
                  name = string;
                });
              },
            ),
            Text("Hello " + name + "!"),
          ],
        ),
      ),
    );
  }

}

