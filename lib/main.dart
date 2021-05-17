import 'package:flutter/material.dart';

main() => runApp(Expenses());

class Expenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Card(
              child: Text("Chart"),
              color: Colors.grey,
              elevation: 5,
            ),
            width: double.infinity,
          ),
          Card(
            child: Text("Transactiosn list"),
          ),
        ],
      ),
    );
  }
}
