import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children: transactions.map((tx) {
            return Card(
                child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$: ${tx.amount.toString()}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.purple),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(DateFormat.yMMMEd().format(tx.date),
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                  ],
                )
              ],
            ));
          }).toList(),
        ),
      ),
    );
  }
}
