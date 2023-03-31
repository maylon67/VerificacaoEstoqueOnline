class ConsultaProdutosModels {
  String localProduto = '';
  String nomeProduto = '';
  String estadoProduto = '';
  //construtor do modelo
ConsultaProdutosModels(
      this.estadoProduto,
      this.localProduto,
      this.nomeProduto,
 );
  ConsultaProdutosModels.fromJson(Map<String,dynamic> json){
  
  }
}
