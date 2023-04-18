import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/models/consulta_produtos_models.dart';
import 'package:verificacao_estoque_online/services/ws_config.dart';

class WsProdutos {
  List<ConsultaProdutosModels> produtosVazios = [];
  Future<List<ConsultaProdutosModels>> getProdutosFromWs(
      int codigoDigitadoProduto) async {
    try {
      MapSD response = await WsController.executePost(
          query:
              "/data/deposito/getProduto/" + codigoDigitadoProduto.toString(),
          duration: Duration(seconds: 10));
      if (response.containsKey('error') ||
          response.containsKey('connection') ||
          response.isEmpty) return produtosVazios;
      List maps = response['produtos'];
      List<ConsultaProdutosModels> produtos = [];
      maps.forEach((element) {
        produtos.add(ConsultaProdutosModels.fromJson(element));
      });
      return produtos;
    } catch (erro) {
      print('===  ERROR getProdutosFromWs : ${erro.toString()} ===');
      return produtosVazios;
    }
  }
}
