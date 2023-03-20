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
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                child: Container(
                  height: 60,
                  width: 200,
                  child: TextField(
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    focusNode: codigofocus,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: markPrimaryColor)),
                        labelText: 'Código',
                        labelStyle: TextStyle(
                            color: markPrimaryColor,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                ),
              ),
              Container(
                height: 61,
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: PrimaryButton(
                      text: 'Buscar',
                      onPressed: () {
                        // carregaHoraLogin();
                        // FocusScope.of(context).unfocus();
                        // login(emailController.text.trim().toLowerCase(),
                        //     passwordController.text);
                        //  AppManager().validLogin = false;
                       }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
