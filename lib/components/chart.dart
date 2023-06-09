import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({super.key, required this.recentTransactions});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        final tr = recentTransactions[i];

        if (tr.date.day == weekDay.day &&
            tr.date.month == weekDay.month &&
            tr.date.year == weekDay.year) {
          totalSum += tr.value;
        }
      }

      return {"day": DateFormat.E().format(weekDay)[0], "value": totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: const <Widget>[],
      ),
    );
  }
}