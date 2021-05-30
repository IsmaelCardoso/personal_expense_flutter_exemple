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
        : ListView(
            children: transactions.map((transaction) {
              return TransactionItem(
                key: ValueKey(transaction
                    .id), //Desta forma o desempenho é melhor, precisa passar a "key" a aprtir do elemento -> "TransactionItem"
                transaction: transaction,
                onRemove: onRemove,
              );
            }).toList(),
          );
    // ListView.builder(
    //     itemCount: transactions.length,
    //     itemBuilder: (context, index) {
    //       final transaction = transactions[index];
    //       return TransactionItem(
    //         key: GlobalObjectKey(
    //             transaction), //Esta forma é muito onerosa ao desempenho, usar somente quando necessãrio
    //         transaction: transaction,
    //         onRemove: onRemove,
    //       );
    //     });
  }
}
