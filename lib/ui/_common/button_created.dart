import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';
class BotaoCriado extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color cor;
 const  BotaoCriado({required this.onPressed, required this.text,this.cor = markPrimaryColor});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Text(text),
      ),
      style: ElevatedButton.styleFrom(
          elevation: 4,
          primary: cor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          textStyle: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)
      ),
    );
  }
}