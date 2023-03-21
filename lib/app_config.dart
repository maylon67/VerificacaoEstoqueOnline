import 'package:flutter/material.dart';

final String version = '1.0.0';

String messageNotConnection = "Falha na conexão, verifique sua rede e tente novamente mais tarde";

///Primary Colors
const Color markPrimaryColor = Color(0xFF479A47);
const Color markSecondaryColor = Colors.green;
final Color markTertiaryColor = Colors.yellow[400]!;
final Color backgroundColor = Colors.grey[200]!;
final Color inativeColor = Color(0xFFE0E0E0);
final Color redColor = Colors.red[700]!;

final Color textDarkColor = Colors.grey[800]!;
final Color colorCard = Colors.grey[350]!;
final Color inactiveColor = Color(0xFFE0DDDD);
final Color blackText = Colors.black;


///Images Paths
const String companyLogo = "lib/assets/images/logo.png";
const String companyLogoGreen = "lib/assets/images/logo_green.png";
const String farmLogo = "lib/assets/images/farm.png";
const String logoAvanti = "lib/assets/images/avanti.png";
const String backgroundAvanti = "lib/assets/images/back.jpg";

/// Sizes
double width(BuildContext context) => MediaQuery.of(context).size.width;
double height(BuildContext context) => MediaQuery.of(context).size.height;

/// Fonts
const String primaryFont = "Kastelov";

/// Animations
const String actor = 'assets/animations/home_animated.riv';

typedef MapSD = Map<String, dynamic>;
