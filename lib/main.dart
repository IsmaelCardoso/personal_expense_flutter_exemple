import 'package:flutter/material.dart';
import './components/transaction_user.dart';

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
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () => {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text(
                  "Chart",
                ),
                color: Colors.grey,
                elevation: 5,
              ),
            ),
            TransactionUser(),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () => {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
