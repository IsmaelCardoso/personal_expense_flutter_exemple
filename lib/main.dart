import 'package:flutter/material.dart';

import './models/transaction.dart';

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
  final _transactions = [
    Transaction(
      id: "t1",
      title: "new running shoes",
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "electricity bill",
      value: 211.30,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          Column(
            children: _transactions
                .map((transaction) => Card(
                        child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.black,
                            width: 2,
                          )),
                          padding: EdgeInsets.all(10),
                          child: Text(transaction.value.toString()),
                        ),
                        Column(
                          children: [
                            Text(transaction.title),
                            Text(transaction.date.toString()),
                          ],
                        )
                      ],
                    )))
                .toList(),
          ),
        ],
      ),
    );
  }
}
