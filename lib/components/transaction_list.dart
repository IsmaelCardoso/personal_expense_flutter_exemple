import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'transaction_empty.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return TransactionEmpty(constraints: constraints);
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return TransactionItem(
                transaction: transaction,
                onRemove: onRemove,
              );
            });
  }
}
