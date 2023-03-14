import 'package:flutter/material.dart';

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
        labelStyle: TextStyle(color: Colors.black,fontSize: 14),
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        )
      ),
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
