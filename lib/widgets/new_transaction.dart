import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTx;

  NewTransaction(this._addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler = TextEditingController();

  final amontControler = TextEditingController();

  void submiteData() {
    final enterTitle = titleControler.text;
    final enterAmount = double.parse(amontControler.text);

    if (enterAmount <= 0 || enterAmount <= 0) return;
    print('enterTitle=' + enterTitle + 'enterAmount=' + enterAmount.toString());
    widget._addTx(enterTitle, enterAmount);

    Navigator.of(context).pop();

    print('amontControler.text');

    // print(amontControler.text);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                  onSubmitted: (_) => submiteData(),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleControler),
              TextField(
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submiteData(),
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amontControler,
              ),
              TextButton(
                onPressed: submiteData,
                child: Text(
                  'Add Transaction11 ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.purple),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
