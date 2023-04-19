import 'package:intl/intl.dart';

class ConsultaProdutosModels {
  var f = NumberFormat('##,###,##0', "pt-br");
  
  int idProduto = 0;
  String nomeProduto = '';
  String unidadeProduto = '';
  int codigoEstoqueProduto = 0;
  String nomeEstoqueProduto = '';
  String quantidadeEstoqueProduto = '';
  //construtor do modelo
ConsultaProdutosModels(
      this.codigoEstoqueProduto,
      this.idProduto,
      this.nomeProduto,
      this.nomeEstoqueProduto,
      this.quantidadeEstoqueProduto,
      this.unidadeProduto,
 );
  ConsultaProdutosModels.fromJson(Map<String,dynamic> json){
  codigoEstoqueProduto = int.parse(json['codigo_estoque'].toString());
  quantidadeEstoqueProduto = f.format((json['quantidade_estoque']));
  idProduto = int.parse(json['id_produto'].toString());
  unidadeProduto = json['unidade_produto'];
  nomeEstoqueProduto = json['nome_estoque'];
  nomeProduto = json['nome_produto'];
  }
}
