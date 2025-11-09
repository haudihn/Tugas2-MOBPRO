import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: const Icon(Icons.attach_money, color: Color.fromARGB(255, 255, 0, 153)),
        title: Text(transaction.title),
        subtitle: Text(transaction.category),
        trailing: Text(
          transaction.amount,
          style: TextStyle(
            color: transaction.amount.startsWith('-')
                ? const Color.fromARGB(255, 122, 0, 0)
                : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}