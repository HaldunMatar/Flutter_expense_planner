import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleControler = TextEditingController();
  final amontControler = TextEditingController();
  final Function _addTx;

  NewTransaction(this._addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleControler),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amontControler,
            ),
            TextButton(
              onPressed: () {
                _addTx(titleControler.text, double.parse(amontControler.text));
                print('amontControler.text');
                // print(amontControler.text);
              },
              child: Text(
                'Add Transaction11 ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
