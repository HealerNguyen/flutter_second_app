import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:second_app/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(1, 'Pay for google api service', 11.12, DateTime.now()),
    Transaction(2, 'Pay for aws api service', 11.19, DateTime.now()),
    Transaction(3, 'Pay for cloud api service', 11.99, DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.green,
                child: Text(
                  'Chart',
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 1,
              ),
            ),
            Column(
                children: transactions.map((transaction) {
              return Card(
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Text(
                      '\$${transaction.amount}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Text(transaction.date.toString(),
                          style: TextStyle(color: Colors.black54))
                    ],
                  )
                ]),
              );
            }).toList())
          ]),
    );
  }
}
