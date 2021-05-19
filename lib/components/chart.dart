import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      recentTransactions.map((recentTransaction) {
        bool someDay = recentTransaction.date.day == weekDay.day;
        bool someMonth = recentTransaction.date.day == weekDay.day;
        bool someYear = recentTransaction.date.day == weekDay.day;

        if (someDay && someMonth && someYear) {
          totalSum += recentTransaction.value;
        }
      });

      return {
        "day": DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
