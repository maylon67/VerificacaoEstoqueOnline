import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/models/consulta_produtos_models.dart';
import 'package:verificacao_estoque_online/ui/codigo_estoque.dart';

class ConsultaProdutoCard extends StatelessWidget {
 // ConsultaProdutoCard();

  //List<ConsultaProdutosModels> produtos;
//List<ConsultaProdutosModels> produtos = [];
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 6,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Column(
          children: [
            Text(
              'CONSULTA PRODUTO',
              style: TextStyle( 
                  color: markPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(120),
                  1: FixedColumnWidth(120),
                  2: FixedColumnWidth(120),
                },
                  children: [
                    createHeadLine(
                        "Código\nEstoque;Nome\nEstoque;Quantidade\nEstoque;"),
                    for (ConsultaProdutosModels i in produtoBuscado)
                      createTable(
                          "${i.codigoEstoqueProduto};${i.nomeEstoqueProduto};${i.quantidadeEstoqueProduto};"),
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow createHeadLine(String headlines) {
    return TableRow(
      children: headlines
          .split(';')
          .map(
            (names) => Column(
              children: [
                Container(
                  height: 80,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    names,
                    style: TextStyle(
                        color: markPrimaryColor, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  color: markPrimaryColor,
                  thickness: 2,
                ),
              ],
            ),
          )
          .toList(),
    );
  }

  createTable(String listcontents) {
    return TableRow(
        children: listcontents
            .split(';')
            .map(
              (contents) => Column(
                children: [
                  Container(
                    height: 55,
                    padding: EdgeInsets.all(8),  
                    alignment: Alignment.center,
                    child: Text(
                      contents,
                      style: TextStyle(color: textDarkColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(color: markPrimaryColor),
                ],
              ),
            )
            .toList());
  }
}
