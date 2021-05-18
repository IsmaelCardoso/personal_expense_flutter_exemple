import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_list.dart';
import './transaction_form.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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
    Transaction(
      id: "t3",
      title: "electricity bill - 2",
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t4",
      title: "electricity bill - 3",
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t5",
      title: "electricity bill - 4",
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t6",
      title: "electricity bill - 5",
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTrasaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTrasaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}