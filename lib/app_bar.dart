/*import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/app_manager.dart';

class AppBarWidget extends PreferredSize {
  final double height;

  AppBarWidget(this.height) : super(child: Text(''), preferredSize: Size.fromHeight(height / 8));

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[markSecondaryColor, markPrimaryColor],
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row( children: [
                  AutoSizeText( "${Utility.getSaudacaoText(nome: Utility.formatWordToLower(AppManager.user.userName, maxWords: 2,))}",
                      maxLines: 2,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      presetFontSizes: [17, 14]),
                ]),
                SizedBox(height: 5,),
                Text(
                    "Seja Bem-Vindo!",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.start
                ),
                SizedBox(height: 10,)
              ],
            ),
            Positioned(
              bottom: -5,
              right: 20,
              child: Image.asset(companyLogo, height: 90, width: 90,),)
          ],
        ),
      ),
      preferredSize: Size.fromHeight(height/8),
    );
  }
}*/