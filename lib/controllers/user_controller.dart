import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';
import '../models/user_model.dart';

//classe responsável por gerenciar minhas ações no objeto user
class UserController with ChangeNotifier {
  //link da minha api
  final String _baseUrl = 'https://644d51ed57f12a1d3ddcfcb7.mockapi.io/users';
  static String? name;

  //Implementação do método para fazer o cadastro na API
  Future<void> signUp(context, String email, String password) async {
    final newUser = UserModel(email: email, password: password);

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(newUser.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro realizado com sucesso'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro não realizado'),
        ),
      );
    }

    notifyListeners();
  }

  //Implementação do método para fazer login
  Future<bool> signIn(context, String email, String password) async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<UserModel> users = (json.decode(response.body) as List)
          .map((user) => UserModel.fromJson(user))
          .toList();

      // Verifica se o email e senha fornecidos correspondem a algum usuário cadastrado
      UserModel? foundUser;
      for (UserModel user in users) {
        if (user.email == email && user.password == password) {
          foundUser = user;
          break;
        }
      }

      // Se encontrou um usuário cadastrado com o email e senha fornecidos
      if (foundUser != null) {
        // Verifica se o usuário encontrado é admin
        if (foundUser.email == "admin" && foundUser.password == "admin") {
          GoRouter.of(context).go('/adminPage');
          return true;
        } else {
          // Caso contrário, trata como um usuário comum
          GoRouter.of(context).go('/userPage');
          return true;
        }
      }
    }
    // Se não encontrou um usuário cadastrado com o email e senha fornecidos, retorna false
    return false;
  }
}
