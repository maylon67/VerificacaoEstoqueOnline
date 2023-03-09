import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/app_manager.dart';
import 'package:verificacao_estoque_online/common_button.dart';
import 'package:verificacao_estoque_online/home_page.dart';
import 'package:verificacao_estoque_online/login/flutter_typeahead.dart';
import 'package:verificacao_estoque_online/user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<String> users=[];

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  Future<void> carregaHoraLogin() async {
    //TODO Tempo de Login
   // AppManager.time = DateTime.now().add(Duration(hours: 2, minutes: 59));
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ValueNotifier<bool> _isLoading = ValueNotifier(false);

  GlobalKey<FormState> _key = new GlobalKey();

  bool isObscure = true;

 /* Future<void> login(
    String email,
    String senha,
  ) async {
    _isLoading.value = true;
    await AppManager().signIn(
        url: 'auth/login',
        email: email,
        senha: senha,
        onSucess: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => HomePageScreen()),
              (Route<dynamic> route) => false);
            print("Entrei Online");
        },
        onSucessLocal: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => HomePageScreen()),
              (Route<dynamic> route) => false);
              print("Entrei Offline");

          //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomePageScreen()),
          //(Route<dynamic> route) => false);
        },
        onError: (error) {
          _isLoading.value = false;
          final snackBar = SnackBar(
            content: Text(
              error,
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            backgroundColor: redColor,
            padding: EdgeInsets.symmetric(vertical: 5),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }, imei: '');
  } */

 /* Future<void> _loadUsers () async {
    List<UserModel> u = await AppManager.allUsers();

    if(u.isNotEmpty){
      u.forEach((element) { 
        users.add(element.email);
      });
    }
  }*/

  @override
  void initState() {
    super.initState();
    emailController.text = '';
    passwordController.text = '';
  //  _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              height: height(context) - MediaQuery.of(context).padding.top,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Form(
                      key: _key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 40,),
                          Image.asset(companyLogoGreen, height: 70, width: 116,),
                          SizedBox(height: 10,),
                          Text(
                            'Granjas 4 Irmãos',
                            style: TextStyle(
                                fontSize: 21,
                                color: textDarkColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Verificação de Estoque',
                            style: TextStyle(
                                fontSize: 18,
                                
                                color: textDarkColor,
                            ),
                          ),
                          Text(
                            version,
                            style: TextStyle(
                                fontSize: 12,
                                color: textDarkColor,
                            ),
                          ),
                          SizedBox(height: 60),
                          Row(
                            children: [
                              Expanded(
                                  child: PrimaryButton(
                                      text: 'Verificar Celular',
                                      onPressed: () {
                                        Navigator.push(
                                          context, MaterialPageRoute(builder: (context) => HomePageScreen(),));
                                       // carregaHoraLogin();
                                       // FocusScope.of(context).unfocus();
                                       // login(emailController.text.trim().toLowerCase(),
                                       //     passwordController.text);
                                       // AppManager().validLogin = false;
                                      })),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: _isLoading,
                      builder: (_, bool isLoading, __) {
                        if (isLoading)
                          return Container(
                              height: double.infinity,
                              width: double.infinity,
                              color: Colors.black45,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              )));
                        else
                          return SizedBox();
                      }),
                 Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('lib/assets/images/fhi.png', height: 30, width: 30,),
                      SizedBox(width: 10,),
                      Text('Desenvolvido por FHI', style: TextStyle(color: markPrimaryColor, fontWeight: FontWeight.bold),)
                    ],
                  ) 
                ),
                ],
              )),
        ),
      ),
    );
  }
}
