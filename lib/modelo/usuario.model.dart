class User{

  late final String nome;
  late final String sobrenome;
  final String email;


  User({
    required this.nome,
    required this.sobrenome,
    required this.email,
  });
  Map<String, dynamic> toJson() => {
    'nome' :  nome,
    'Sobrenome' :  sobrenome,
    'email' :  email,

  };
  static User fromJson(Map<String, dynamic> json) => User(
    nome: json['nome'],
    sobrenome: json['Sobrenome'],
    email: json['email'],

  );
}