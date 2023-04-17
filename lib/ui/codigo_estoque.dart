// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/estoque_card.dart';
import 'package:verificacao_estoque_online/models/consulta_produtos_models.dart';
import 'package:verificacao_estoque_online/services/ws_config.dart';
import 'package:verificacao_estoque_online/services/ws_produtos.dart';
import 'package:verificacao_estoque_online/ui/_common/common_button.dart';
 List<ConsultaProdutosModels> produtoBuscado = [];
class CodigoEstoque extends StatefulWidget {
  const CodigoEstoque({Key? key}) : super(key: key);

  @override
  State<CodigoEstoque> createState() => _CodigoEstoqueState();
}

class _CodigoEstoqueState extends State<CodigoEstoque> {
  
  final codigofocus = FocusNode();
  bool estaVazio = true;
 
 
  TextEditingController controletextfield = TextEditingController();
  loadData() async{
    produtoBuscado = await WsProdutos().getProdutosFromWs(int.parse(controletextfield.text));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seja bem vindo usuário',
          softWrap: false,
          style: TextStyle(
              fontSize: 21, color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: markPrimaryColor,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    child: Container(
                      height: 60,
                      width: 200,
                      child: TextField(
                        autocorrect: true,
                        maxLength: 10, 
                        controller: controletextfield,
                        keyboardType: TextInputType.number,
                        focusNode: codigofocus,
                        autofocus: false,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: markPrimaryColor,
                          )),
                          labelText: 'Código',
                          labelStyle: TextStyle(
                              color: markPrimaryColor,
                              fontSize: 23,
                              // backgroundColor: markPrimaryColor,
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 160,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: PrimaryButton(
                          text: 'Buscar',
                          onPressed: () async {
                            // produtobuscado = await WsProdutos().getProdutosFromWs(
                            //     int.parse(controletextfield.text));
                                loadData();
                            estaVazio = false;
                            setState(() {
                            });
                          }),
                    ),
                  ),
                ],
              ),
              estaVazio ? SizedBox() : ConsultaProdutoCard(), 
            ],
          ),
        ),
      ),
    );
  }
}
