import 'package:expense_planner/widgets/chart-bar.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'transaction_list.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    print('tttttttttt');
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      print('chart fordate ::::  ' + DateFormat.E().format(weekDay));

      print(totalSum.toString());
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Card(
          elevation: 6,
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((data) {
              return Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'],
                    data['amount'],
                    totalSpending == 0.0
                        ? 0
                        : ((data['amount']) as double) / totalSpending),
              );
            }).toList(),
          )),
    );
  }
}