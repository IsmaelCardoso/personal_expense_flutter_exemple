import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  final bool isLandscape;

  Chart(this.recentTransactions, this.isLandscape);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      recentTransactions.map((recentTransaction) {
        bool someDay = recentTransaction.date.day == weekDay.day;
        bool someMonth = recentTransaction.date.month == weekDay.month;
        bool someYear = recentTransaction.date.year == weekDay.year;

        if (someDay && someMonth && someYear) {
          totalSum += recentTransaction.value;
        }
      });

      return {
        "day": DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(
      0.0,
      (sum, transaction) => sum += (transaction['value'] as double),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions
              .map(
                (transaction) => Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    label: transaction["day"],
                    value: transaction["value"],
                    percentage: _weekTotalValue == 0
                        ? 0
                        : (transaction['value'] as double) / _weekTotalValue,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
