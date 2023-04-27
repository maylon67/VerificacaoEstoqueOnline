import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const PrimaryButton({ required this.text, required this.onPressed, this.color = markPrimaryColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(text),
      ),
      style: ElevatedButton.styleFrom(
          elevation: 4,
          primary: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          textStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)
      ),
    );
  }
}
