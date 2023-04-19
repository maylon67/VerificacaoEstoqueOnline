import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';

class AlteraEstoquePage extends StatefulWidget {
  const AlteraEstoquePage({Key? key}) : super(key: key);

  @override
  State<AlteraEstoquePage> createState() => _AlteraEstoquePageState();
}

class _AlteraEstoquePageState extends State<AlteraEstoquePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alterar Estoque',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: markPrimaryColor,
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      body: SafeArea(
          child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 6,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Text('ITEM 1',textAlign: TextAlign.center),
                ],
              ),
              Row(
                children: [
                  Text('ITEM 2',textAlign: TextAlign.center),
                ],
              ),
              Row(
                children: [
                  Text('ITEM 3',textAlign: TextAlign.center),
                ],
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
