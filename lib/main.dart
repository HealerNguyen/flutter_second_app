// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:second_app/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:second_app/widgets/chart.dart';
import 'package:second_app/widgets/new_transaction.dart';
import 'package:second_app/widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(primarySwatch: Colors.blue ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(1, 'Pay for google api service', 11.12, DateTime.now()),
    // Transaction(2, 'Pay for aws api service', 11.19, DateTime.now()),
    // Transaction(3, 'Pay for cloud api service', 11.99, DateTime.now())
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        )
      );
    }).toList();
  }
  
  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      DateTime.now().millisecondsSinceEpoch / 1000,
      title,
      amount, date
    );
    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  void _triggerOpenModal(ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(child: NewTransaction(_addNewTransaction), onTap: () {},
        behavior: HitTestBehavior.opaque,
      );
    });
  }

  void _deleteTransaction(double id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.home), onPressed: () => {},
          splashRadius: 20,
        ),
        title: Text('Home Page'),
        actions: [
          IconButton(
            splashRadius: 20,
            icon: Icon(
              Icons.payment,
              color: Colors.white,
            ),
            onPressed: () => {},
          ),
          IconButton(
            splashRadius: 20,
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Chart(_recentTransactions),
              // Expanded(
                // child: TransactionList(_transactions,_deleteTransaction)
              // )
              TransactionList(_transactions,_deleteTransaction)
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () => _triggerOpenModal(context), 
        child: Icon(Icons.add),
      ),
    );
  }
}
