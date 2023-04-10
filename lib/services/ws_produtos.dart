import 'package:flutter/material.dart';
import 'package:verificacao_estoque_online/app_config.dart';
import 'package:verificacao_estoque_online/models/consulta_produtos_models.dart';
import 'package:verificacao_estoque_online/services/ws_config.dart';

class WsProdutos {
  Future<ConsultaProdutosModels> getProdutosFromWs(int codigoDigitadoProduto) async {
    try {
      MapSD response = await WsController.executePost(
          query: "/data/deposito/getProduto/"+ codigoDigitadoProduto.toString(),
          duration: Duration(seconds: 10));

      if (response.containsKey('error') ||
          response.containsKey('connection') ||
          response.isEmpty) return ConsultaProdutosModels(0, 0, '', '', 0, '');
     MapSD mapa = response['produto'];
      ConsultaProdutosModels produto =
          ConsultaProdutosModels.fromJson(mapa);
      return produto;
    } catch (erro) {
      print('===  ERROR getProdutosFromWs : ${erro.toString()} ===');
      return ConsultaProdutosModels(0, 0, '', '', 0, '');
    }
  }
}
