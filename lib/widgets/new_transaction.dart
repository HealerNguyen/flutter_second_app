import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final addNewTransaction;
  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final priceController = TextEditingController();

  DateTime? _selectedDate;


  void _showDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2021), 
      lastDate: DateTime(2098),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (value) => {titleInput = value},
              controller: titleController,
              keyboardType: TextInputType.text,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Cost'),
            // onChanged: (value) => {priceInput = value},
            controller: priceController,
            keyboardType: TextInputType.number,
          ),
          Row(
            children: [
              Text(_selectedDate == null ? 'No date selected' : 'Date: ${DateFormat.yMd().format(_selectedDate!)}'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: _showDatePicker, 
                splashRadius: 20,
                // splashColor: Colors.blueGrey,
                icon: Icon(
                  Icons.event,
                  color: Colors.green,
                ),),
              )
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(top: 10),
            child: ElevatedButton.icon(
                label: Text('Add record'),
                icon: Icon(Icons.add),
                // icon: SizedBox(
                //   width: 15,
                //   height: 15,
                //   child: CircularProgressIndicator(
                //     color: Colors.white,
                //     strokeWidth: 3,
                //   ),
                // ),
                onPressed: () => {
                   widget.addNewTransaction(
                    titleController.text,double.parse(priceController.text), _selectedDate
                  )
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(vertical: 13, horizontal: 12)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                )),
          )
        ]),
      )),
    );
  }
}
