import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/services/ws_config.dart';
import 'package:verificacao_estoque_online/user.dart';

class AppManager extends ChangeNotifier {

bool validLogin = true;
bool loading = false;

static DateTime? time;

  Future<dynamic> signIn({
    required String url,
    required String email,
    required String senha,
    required Function onSucess,
    required Function onSucessLocal,
    required Function onError,
  }) async {

    String passwordToSHA256 = sha256.convert(utf8.encode(senha)).toString();

        String body = jsonEncode({
          'email': email,
          'password': passwordToSHA256,
        });

        MapSD result = await WsController.executeDb(query: "/auth/login", body: body, duration: Duration(seconds: 15));
        print(result);

        if(result['login']){
          var timeLogin = DateTime.now().add(Duration(hours: 2, minutes: 59));
          time = timeLogin;

          onSucess();
        return;
      }

       // static Future<List<UserModel>> allUsers() async => await _db.selectAllUsers();

}
}