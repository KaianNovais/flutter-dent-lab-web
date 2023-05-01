
class ConsultaModel {
  //variáveis de instância
  final String? id;
  final String idUser;
  final String data;
  final String horario;

  //construtor
  ConsultaModel({  this.id, required this.idUser, required this.data, required this.horario});

  // Construtor factory para converter o JSON em um objeto ConsultaModel
  factory ConsultaModel.fromJson(Map<String, dynamic> json) {
    return ConsultaModel(
      id: json['id'],
      idUser: json['idUser'],
      data: json['data'],
      horario: json['horario'],
    );
  }

  //converte nosso objeto em um json
  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'data': data,
      'horario': horario
    };
  }
}
