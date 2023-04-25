import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/models/consulta_produtos_models.dart';
import 'package:verificacao_estoque_online/ui/codigo_estoque.dart';

class AlteraEstoquePage extends StatefulWidget {
 // const AlteraEstoquePage({Key? key}) : super(key: key);
AlteraEstoquePage(this.i);
late ConsultaProdutosModels i;

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.i.codigoEstoqueProduto.toString(),textAlign: TextAlign.center),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.i.nomeEstoqueProduto,textAlign: TextAlign.center),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.i.quantidadeEstoqueProduto,textAlign: TextAlign.center),
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
