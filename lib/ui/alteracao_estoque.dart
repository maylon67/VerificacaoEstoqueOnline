import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/models/consulta_produtos_models.dart';
import 'package:verificacao_estoque_online/ui/_common/button_created.dart';
import 'package:verificacao_estoque_online/ui/_common/common_button.dart';
import 'package:verificacao_estoque_online/ui/codigo_estoque.dart';

  int _stockCount = 0;
  int estoqueAtualizado = 0;
class AlteraEstoquePage extends StatefulWidget {
  // const AlteraEstoquePage({Key? key}) : super(key: key);
  AlteraEstoquePage(this.i);
  late ConsultaProdutosModels i;

  // var numeroFormatado = i.quantidadeEstoqueProduto.toStringAsFixed(4);

  @override
  State<AlteraEstoquePage> createState() => _AlteraEstoquePageState();
}

class _AlteraEstoquePageState extends State<AlteraEstoquePage> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _controller.text = _stockCount as TextEditingController,
    _controller.text = widget.i.quantidadeEstoqueProduto;
  }

 // void _updateStockCount(double value) {
 //   setState(() {
    // _controller = _stockCount as TextEditingController;
   // });
 // }

   void _incrementStockCount() {
    setState(() {
      _stockCount++;
    });
  }

  void _decrementStockCount() {
    setState(() {
      _stockCount--;
    });
  }
  
  void _AtualizarEstoque(){
    setState(() {
    // widget.i.quantidadeEstoqueProduto = _stockCount.toString();
    // estoqueAtualizado = _stockCount;
    });
  }
  
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 436),
            child: Column(
              children: [
                Card(
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
                              style: TextStyle(
                                  fontSize: 20, color: markPrimaryColor),
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
                                      (widget.i.quantidadeEstoqueProduto),
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
                Padding(padding: EdgeInsets.symmetric(vertical: 50),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          _decrementStockCount();
                        },
                        child: Icon(
                          Icons.remove_circle,
                          color: markPrimaryColor,
                          size: 80,
                        )),
                         SizedBox(width: 20),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Estoque',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    onChanged: (value) {
                       _controller.value;
                    },
                  ),
                ),
                    SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          _incrementStockCount();
                        },
                        child: Icon(
                          Icons.add_circle,
                          color: markPrimaryColor,
                          size: 80,
                        )),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                Container(
                  height: 55,
                  width: 240,
                  child: BotaoCriado(
                      onPressed: () {
                        setState(() {
                         // _AtualizarEstoque();
                        });
                      },
                      text: 'Atualizar',
                      cor: markPrimaryColor,
                      ),
                ),
              ],
            ),
          ),
        ));
  }
}
