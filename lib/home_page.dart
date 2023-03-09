import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_bar.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/app_manager.dart';
import 'package:verificacao_estoque_online/card_home_enabled.dart';
import 'package:verificacao_estoque_online/homeCard.dart';
import 'package:verificacao_estoque_online/home_card_disabled.dart';
import 'package:verificacao_estoque_online/verificacao_estoque_page.dart';

class HomePageScreen extends StatefulWidget {

  const HomePageScreen();

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  final List<HomeCard> listCards = [];

  void goTo({@required Widget? route}) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => route!));
  }

  void createCards () {
   // listCards.add(
   //   HomeCard(
   //     'Autorizações', 
   //     Icons.assignment_outlined, 
   //     context, 
   //     AppManager.user.permissions.split(';').contains("AUTORIZACOES"),
   //     () { goTo(route: VerificacaoEstoquePage());}
   //   )
   // );
   
    // listCards.add(
    //   HomeCard(
    //     "Estoque dos Silos",
    //     Icons.assessment,
    //     context,
    //     AppManager.user.permissions.split(';').contains("GERENCIAL_APP_MANEJO"),
    //     () {goTo(route: ArmazenamentoSilo());}
    //   )
    // );
    // listCards.add(
    //   HomeCard(
    //     "Combustíveis",
    //     Icons.emoji_transportation,
    //     context,
    //     true,
    //     () => goTo(route: CombustiveisScreen())
    //   )
    // );
  }


  @override
  void initState() {
    super.initState();
    createCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seja bem vindo, Usuário'), backgroundColor: Color.fromARGB(255, 7, 107, 10),), //AppBarWidget(height(context)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                GridView.count(
                  childAspectRatio: 1.2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    for (final card in listCards)
                      card.enable ? CardHomeEnabled(card) : CardHomeDisabled(card) 
                  ],
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
