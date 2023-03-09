import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        title: Text('Seja Bem vindo, Usuario!'),
        backgroundColor: Color.fromARGB(255, 12, 199, 80),
        titleTextStyle: GoogleFonts.mochiyPopOne(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 25)),
            ],
          ),
        ),
      ),
    );
  }
}