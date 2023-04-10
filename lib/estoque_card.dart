import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/models/consulta_produtos_models.dart';

class ConsultaProdutoCard extends StatelessWidget {
  ConsultaProdutoCard(this.produtosModels);

  //List<ConsultaProdutosModels> produtos;
ConsultaProdutosModels produtosModels;
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
              produtosModels.nomeEstoqueProduto,
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
                  0: FixedColumnWidth(110),
                  1: FixedColumnWidth(90),
                  2: FixedColumnWidth(90),
                },
                //  children: [
                //    createHeadLine(
                //        "Data\nVencimento;Valor\nPrincipal;Valor\nJuros;Valor\nTotal"),
                //    for (ConsultaProdutosModels i in produtos)
                //      createTable(
                //          "${i.dataVencimento};${i.valorPrincipal};${i.valorJuros};${i.totalValor}"),
                //  ],
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
                      produtosModels.nomeEstoqueProduto,
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
