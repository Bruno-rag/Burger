class Item{
  String id;
  final String nome;
  final double? preco;
  final String urlAvatar;
  final String descricao;
  final int? quantidade;

  Item({
    this.id = '',
    required this.nome,
    this.preco,
    required this.urlAvatar,
    required this.descricao,
    this.quantidade,
  });

  Map<String, dynamic> toJson() => {
    "id" : id,
    'nome' :  nome,
    //'preco' :  preco,
    'url' :  urlAvatar,
    'descricao' :  descricao,
    //'quatidade' :  quantidade,
  };

  static Item fromJson(Map<String, dynamic> json) => Item(
      id: json['id'],
      nome: json['nome'],
      preco: json['preco'] as double,
      urlAvatar: json['url'],
      descricao: json['descricao'],
     // quantidade: json['quantidade'],
  );
}