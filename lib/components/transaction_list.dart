import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.05),
                Container(
                  height: constraints.maxHeight * 0.15,
                  child: Text(
                    "No registered transactions!",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                Container(
                  height: constraints.maxHeight * 0.75,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text(
                          'R\$ ${transaction.value}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transaction.title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(transaction.date),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? TextButton.icon(
                          onPressed: () => onRemove(transaction.id),
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                          label: Text(
                            "Excluir",
                            style: TextStyle(
                              color: Theme.of(context).errorColor,
                            ),
                          ),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => onRemove(transaction.id),
                        ),
                ),
              );
            });
  }
}
