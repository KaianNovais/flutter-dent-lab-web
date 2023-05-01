//classe que representa a minha entidade usuário
class UserModel {
  //variáveis de instância
  final String email;
  final String password;

  //construtor
  UserModel({
    required this.email,
    required this.password,
  });

  //construtor responsável por converter um json em um objeto UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
    );
  }
  //converte nosso objeto em um Json
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
