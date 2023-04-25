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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 436),
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Código: " + widget.i.idProduto.toString(),
                        style: TextStyle(fontSize: 20, color: markPrimaryColor),
                      ),
                      // Text(
                      //   widget.pedido_hist.produtos[index].nomeProduto,
                      //   style: TextStyle(fontSize: 16, color: markPrimaryColor),
                      // ),
                      Divider(color: markPrimaryColor),
                      Row(
                        children: [
                          Text(
                            "Produto: " + widget.i.nomeProduto,
                            style: TextStyle(
                                fontSize: 20, color: markPrimaryColor),
                          ),
                          // Text(
                          //   widget.pedido_hist.produtos[index].productId.toString(),
                          //   style: TextStyle(fontSize: 16, color: markPrimaryColor),
                          // ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Cód. Estoque: " +
                                widget.i.codigoEstoqueProduto.toString(),
                            style: TextStyle(
                                fontSize: 20, color: markPrimaryColor),
                          ),
                          // Text(
                          //   "R\$" +
                          //       currencyFormat
                          //           .format(
                          //             widget.pedido_hist.produtos[index].precoUnitario,
                          //           )
                          //           .toString(),
                          //   style: TextStyle(fontSize: 16, color: markPrimaryColor),
                          // ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Local: ' + widget.i.nomeEstoqueProduto,
                            style: TextStyle(
                                fontSize: 20, color: markPrimaryColor),
                          ),
                          // Text(
                          //   widget.pedido_hist.produtos[index].quantidade.toString(),
                          //   style: TextStyle(fontSize: 16, color: markPrimaryColor),
                          // ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Qtd. Anterior: " +
                                widget.i.quantidadeEstoqueProduto,
                            style: TextStyle(
                                fontSize: 20, color: markPrimaryColor),
                          ),
                          // Text(
                          //   "R\$" +
                          //       currencyFormat
                          //           .format(
                          //             widget.pedido_hist.produtos[index].total,
                          //           )
                          //           .toString(),
                          //   style: TextStyle(fontSize: 16, color: markPrimaryColor),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        );
  }
}

/*SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: markPrimaryColor, width: 2.5)),
            elevation: 6,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Id Produto:',
                          style: TextStyle(
                              fontSize: 30,
                              color: markPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.i.idProduto.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Produto:',
                          style: TextStyle(
                              fontSize: 30,
                              color: markPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.i.nomeProduto.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Código Produto:',
                          style: TextStyle(
                              fontSize: 30,
                              color: markPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.i.codigoEstoqueProduto.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Local:',
                          style: TextStyle(
                              fontSize: 30,
                              color: markPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.i.nomeEstoqueProduto.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Quantidade Ant:',
                          style: TextStyle(
                              fontSize: 30,
                              color: markPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.i.quantidadeEstoqueProduto,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),*/
      