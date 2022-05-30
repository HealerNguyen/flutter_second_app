// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return !transactions.isEmpty
        ? Container(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.titleLarge),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: IconButton(
                      onPressed: () => deleteTransaction(transactions[index].id),
                      splashRadius: 20,
                      // splashColor: Colors.blueGrey,
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
              //   children: transactions.map((transaction) {

              // }).toList()),
            ))
        : Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.asset(
                  'assets/images/t1.png',
                  height: 180,
                ),
              ),
              Text(
                'No data! Click button to add your record',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          );
  }
}
