// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/ui/_common/common_button.dart';

class CodigoEstoque extends StatefulWidget {
  const CodigoEstoque({Key? key}) : super(key: key);

  @override
  State<CodigoEstoque> createState() => _CodigoEstoqueState();
}

class _CodigoEstoqueState extends State<CodigoEstoque> {
  final codigofocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seja bem vindo usuário',
          style: TextStyle(
              fontSize: 21, color: Color.fromARGB(179, 255, 255, 255)),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 25)),
                Center(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    focusNode: codigofocus,
                    decoration: InputDecoration(
                        labelText: 'Código',  
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                Center(
                  child: TextButton(
                    child: Text(
                      'Verficar o estoque',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)))
                            ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
