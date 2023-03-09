import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/homeCard.dart';

class CardHomeDisabled extends StatelessWidget {

  final HomeCard button;

  const CardHomeDisabled(this.button);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: inativeColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Icon(button.icon, size: 32, color: textDarkColor)
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
      ),
    );
  }
}