import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/models/consulta_produtos_models.dart';
import 'package:verificacao_estoque_online/services/ws_config.dart';

class WsProdutos{
  Future<List<ConsultaProdutosModels>> getCulturasFromWs() async {
    
    try {
      MapSD response = await WsController.executePost(query: "/data/getCulturas", duration: Duration(seconds: 5));
      
      if (response.containsKey('error') || response.containsKey('connection') || response.isEmpty) return [];
      
      List maps = response['culturas'];
      
      List<ConsultaProdutosModels> produtos = [];
      maps.forEach((element) {
        produtos.add(ConsultaProdutosModels.fromJson(element));
      });
      
      return produtos;
    } catch (e) {
      print('===  ERROR getCulturasFromWs : ${e.toString()} ===');
      return [];
    }
  }}
