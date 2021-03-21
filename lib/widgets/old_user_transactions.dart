import '../models/transaction.dart';
import 'package:flutter/material.dart';

import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    /* Transaction(id: '1', title: 'TransTitle1', amount: 5, date: DateTime.now()),
    Transaction(id: '2', title: 'TransTitle2', amount: 6, date: DateTime.now()),
    Transaction(id: '3', title: 'TransTitle3', amount: 7, date: DateTime.now()),
    Transaction(id: '4', title: 'TransTitle4', amount: 8, date: DateTime.now()),*/
  ];

  _addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
