import 'package:flutter/material.dart';

class HomeCard{

  String titulo;
  IconData icon;
  BuildContext context;
  VoidCallback action;
  bool enable;

  HomeCard(this.titulo, this.icon, this.context, this.enable, this.action);

}
