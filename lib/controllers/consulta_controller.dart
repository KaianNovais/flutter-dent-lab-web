import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dent_lab/app_config.dart';
import 'package:http/http.dart' as http;
import '../models/consulta_model.dart';

// Classe onde fica os métodos controladores das consultas
class ConsultaController with ChangeNotifier {
  //link da minha API do mockAPI
  final String apiUrl = 'https://644d51ed57f12a1d3ddcfcb7.mockapi.io/consultas';
  
  //método que implementa a busca das consultas na api
  Future<List<ConsultaModel>> fetchConsultas() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<ConsultaModel> consultas = jsonResponse.map((consulta) => ConsultaModel.fromJson(consulta)).toList();
      return consultas;
    } else {
      throw Exception('Failed to load consultas');
    }
  }

  //método que implementa o agendamento das consultas
  Future<void> agendarConsulta(context, String id, String userName) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'idUser': userName,
      }),
    );

    if (response.statusCode == 200) {
      debugPrint('Consulta agendada com sucesso');
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: Colors.green[600],
          content: Text('Agendamento realizado com sucesso!', style:textoAppBar()),
        ),
      );
    } else {
      throw Exception('Failed to update consulta');
    }
  }
  //método que implementa o cancelamento de uma consulta
  Future<bool> removeConsulta(context, String id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      debugPrint('Consulta removida com sucesso.');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar( backgroundColor: Colors.red, content: Text('Consulta removida com sucesso.')));
      return true;
    } else {
      debugPrint('Falha ao remover a consulta.');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar( backgroundColor: Colors.red, content: Text('Falha ao remover a consulta.')));
      return false;
    }
  }
  //método que implementa o cadastro de uma nova consulta disponivel
  Future<void> cadastrarConsulta(context, String descricao, String data, String horario) async {
    final newConsulta = ConsultaModel(idUser: descricao, data: data, horario: horario);

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(newConsulta.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      fetchConsultas();
    } 

    notifyListeners();
  }
}
