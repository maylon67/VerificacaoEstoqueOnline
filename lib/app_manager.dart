/*import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/user.dart';

class AppManager extends ChangeNotifier {

  bool validLogin = true;
  bool loading = false;

  bool firstLogin = false;
  int cont = 0;

  /// horas do ultimo login e hora que expira o login
  var timeOfTheLastLogin;
  var timeOfExpiration;

  static UserModel user = UserModel(
      email: '',
      userName: '',
      userId:-1,
      password: '',
      permissions: '',
      lastLogin: '',
      isLogged: -1
    );

  static DateTime? time;

  static DatabaseHelper _db = DatabaseHelper();

  AppManager(){
    carregaPageload();
  }

  Future<void> signIn({
    required String url,
    required String email,
    required String senha,
    required Function onSucess,
    required Function onSucessLocal,
    required Function onError,
  }) async {

    if(email.isEmpty || !email.contains('@') || email.length<6){
      onError("Informe um email válido");
      return;
    }

    if(senha.isEmpty || senha.length<6){
      onError("Informe uma senha válida");
      return;
    }

    String passwordToSHA256 = sha256.convert(utf8.encode(senha)).toString();

    try {
      if (await WsController.testConnection()) {

        print('===== LOGIN ONLINE =====');

        String body = jsonEncode({
          'email': email,
          'password': passwordToSHA256,
        });
        MapSD result = await WsController.executeWsPost(query: "/auth/login", body: body, duration: Duration(seconds: 30));
        print(result);

        if(result['login']){
          var timeLogin = DateTime.now().add(Duration(hours: 2, minutes: 59));
          time = timeLogin;

          user = UserModel(
            email: email,
            password: passwordToSHA256,
            userName: result['user'],
            userId: result['codigo'],
            permissions: result['permissions'],
            lastLogin: timeLogin.toIso8601String(),
            isLogged: 1
          );
          print('INSERIU $timeLogin');
          await _db.deleteUser(email);
          await _db.insertUserInDB(user);
        }

        if(!result['login']){
          onError("Login não concedido!");
          return;
        }

        if (result.containsKey("error")) {
          throw Exception();
        }

        if (result.containsKey("connection")) {
          onError("Falha na conexão com o WebService, tente novamente!");
          return;
        }

        if (result.containsKey("errorMessage")) {
          onError(result['errorMessage']);
          return ;
        }
        onSucess();

      } else {
        onError("A conexão com o WebService falhou, verifique sua internet e tente novamente");
        print('===== LOGIN LOCAL =====');

        List<UserModel> localUser = await _db.selectUserEmailId(email, passwordToSHA256);

        if(localUser.isNotEmpty) {
          print(localUser[0]);
          user = UserModel(
            email: email,
            password: passwordToSHA256,
            userName: localUser[0].userName,
            userId: localUser[0].userId,
            permissions: localUser[0].permissions,
            lastLogin: localUser[0].lastLogin,
            isLogged: 1,
          );

          if(user.lastLogin != '')
          time = DateTime.parse(user.lastLogin);

          await _db.deleteUser(email);
          await _db.insertUserInDB(user);

          print('Login Válido: $time');

          onSucessLocal();
        } else {
          onError("Falha no login!");
        }

        return;
      }
    } catch (e) {
      print(e);
      onError("Ocorreu um erro inesperado, tente novamente " + e.toString());
      return;
    }
  }

  Future<void> carregaPageload() async{
    loading = false;
    cont = 1;
  }
  /// Funções de verificação de Data
  Future<bool> verificaHoraDoLogin() async{

    late bool verificacao;
    timeOfTheLastLogin = DateTime.now();

    verificacao = timeOfTheLastLogin.isAfter(timeOfExpiration);
    verificacao == true
    ? validLogin = false
    : validLogin = true;

    return validLogin;
  }

  /// Funções de verificação de Data
  Future<void> startDurationOfLogin() async{
    timeOfTheLastLogin = DateTime.now();
    timeOfExpiration = timeOfTheLastLogin.add(Duration(minutes: 3));
    print("$timeOfTheLastLogin time now   =================================");
    print("$timeOfExpiration tempo de expiração =================================");

  }

  Future<void> logout (Function navigate) async {

    await _db.deleteUser(user.email);
    await _db.insertUserInDB(user.copyWith(isLogged: 0));

    user = UserModel( 
      email: '',
      password: '', 
      userName: '', 
      permissions: '',
      userId: -1,
      lastLogin: '',
      isLogged: -1
    );
    time = null;
    navigate();
  }

 // Future<List<OrdemDeCompra>> carregaOrdensDeCompra() async{
 //   Future<List<OrdemDeCompra>> ordemDeCompra = WsController().getAllOrdensDeCompraFromWs();
 //   return ordemDeCompra;
 // }

  static Future<List<UserModel>> allUsers() async => await _db.selectAllUsers();


}*/