// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';
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
          child: Container(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 25)),
                Row(
                  children: [
                    TextField(
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      focusNode: codigofocus,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: markPrimaryColor)),
                          labelText: 'Código',
                          labelStyle:
                              TextStyle(color: markPrimaryColor, fontSize: 14,fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                    ),
                TextButton(
                  child: Text(
                    'Buscar',
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(markPrimaryColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)))),
                  onPressed: () {},
                ),
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
