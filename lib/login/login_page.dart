import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/managers/app_manager.dart';
import 'package:verificacao_estoque_online/home_page.dart';
import 'package:verificacao_estoque_online/ui/_common/common_button.dart';
import 'package:verificacao_estoque_online/ui/codigo_estoque.dart';
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
    //AppManager.time = DateTime.now().add(Duration(hours: 2, minutes: 59));
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ValueNotifier<bool> _isLoading = ValueNotifier(false);

  GlobalKey<FormState> _key = new GlobalKey();

  bool isObscure = true;

  Future<void> login(
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
              MaterialPageRoute(builder: (_) => CodigoEstoque()),
              (Route<dynamic> route) => false);
            print("Entrei Online");
        },
        onSucessLocal: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => CodigoEstoque()),
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
        });
  }

  /*Future<void> _loadUsers () async {
    List<UserModel> u = await AppManager();

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
   // _loadUsers();
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
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 6,
                            child: TypeAheadField(
                              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white
                              ),
                              textFieldConfiguration: TextFieldConfiguration(
                                focusNode: emailFocus,
                              controller: emailController,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: primaryFont,
                                  color: textDarkColor),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 5),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: markPrimaryColor,
                                ),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    fontSize: 18, color: markPrimaryColor),
                                alignLabelWithHint: false,
                              ),
                              ),
                              noItemsFoundBuilder: (context) => Container(height: 0, width: 0),
                              loadingBuilder: (context) => Container(height: 0, width: 0),
                              suggestionsCallback: (pattern) async { 
                                if (pattern == "") return users;     
                                return users.where((element) => element.contains(pattern));
                              },
                              itemBuilder: (context, String suggestion) => ListTile(
                                title: Text(suggestion)
                              ),
                              onSuggestionSelected: (String suggestion) {
                                emailController.text = suggestion;
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 6,
                            child: TextFormField(
                              obscureText: isObscure,
                              focusNode: passwordFocus,
                              controller: passwordController,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: primaryFont,
                                color: textDarkColor,
                              ),
                              decoration: InputDecoration(
                                errorStyle: TextStyle(),
                                contentPadding: EdgeInsets.symmetric(vertical: 5),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: markPrimaryColor,
                                ),
                                labelText: 'Senha',
                                labelStyle: TextStyle(
                                    fontSize: 18, color: markPrimaryColor),
                                alignLabelWithHint: false,
                                suffixIcon: IconButton(
                                onPressed: (){setState(() => isObscure = !isObscure);}, 
                                icon: Icon(
                                  isObscure ? Icons.visibility : Icons.visibility_off, 
                                  color: markPrimaryColor,
                                )
                              ),
                              ),
                            ),
                          ),
                          SizedBox(height: 60),
                          Row(
                            children: [
                              Expanded(
                                  child: PrimaryButton(
                                      text: 'Login',
                                      onPressed: () {
                                        carregaHoraLogin();
                                        FocusScope.of(context).unfocus();
                                        login(emailController.text.trim().toLowerCase(),
                                            passwordController.text);
                                        AppManager().validLogin = false;
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
                      Image.asset('lib/assets/images/bisoft.png', height: 42, width: 42,),
                      SizedBox(width: 10,),
                      Text('Desenvolvido por Bisoft', style: TextStyle(color: blackText, fontWeight: FontWeight.bold),)
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
