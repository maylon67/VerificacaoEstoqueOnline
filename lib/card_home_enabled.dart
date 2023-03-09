import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/homeCard.dart';

class CardHomeEnabled extends StatelessWidget {

  final HomeCard button;

  const CardHomeEnabled(this.button);

 @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 6,
      child: InkWell(
        onTap: button.action,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Icon(button.icon, size: 32, color: markPrimaryColor)
                )
              ),
              SizedBox(height: 10),
              Expanded(
                child: Text(
                  button.titulo, 
                   style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: textDarkColor,
                    ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}