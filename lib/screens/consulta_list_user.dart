import 'package:flutter/material.dart';
import 'package:flutter_dent_lab/app_config.dart';
import 'package:flutter_dent_lab/controllers/user_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../controllers/consulta_controller.dart';
import '../models/consulta_model.dart';

class ConsultasListUser extends StatefulWidget {
  const ConsultasListUser({super.key});

  @override
  State<ConsultasListUser> createState() => _ConsultasListUserState();
}

class _ConsultasListUserState extends State<ConsultasListUser> {
  final name = UserController.name;
  TextEditingController searchController = TextEditingController();

  List<ConsultaModel> filterConsultas(
      List<ConsultaModel> consultas, String searchText) {
    if (searchText.isEmpty) {
      return consultas;
    } else {
      return consultas
          .where((consulta) =>
              consulta.idUser.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(FontAwesomeIcons.stethoscope,
                  color: Colors.deepPurple),
              const SizedBox(width: 8),
              name == "admin"
                  ? Text('Consultas dos clientes', style: textoBotao())
                  : Text('Suas consultas agendadas', style: textoBotao()),
              const SizedBox(width: 8),
              if (name == "admin")
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      labelText: 'Pesquisar por cliente',
                      hintText: 'Pesquisar',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ConsultaController>(
          builder: (context, consultaController, child) {
            return FutureBuilder<List<ConsultaModel>>(
              future: consultaController.fetchConsultas(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ConsultaModel> consultas;
                  if (name == "admin") {
                    consultas = filterConsultas(
                        snapshot.data!
                            .where(
                                (consulta) => consulta.idUser != "disponivel")
                            .toList(),
                        searchController.text);
                  } else {
                    consultas = snapshot.data!
                        .where((consulta) => consulta.idUser == name)
                        .toList();
                  }

                  return consultas.isEmpty
                      ? Center(
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sem consultas agendadas",
                                style: textoBotao()),
                            Image.asset(
                              'images/sad-face.png',
                              width: 72,
                              height: 72,
                            ),
                          ],
                        ))
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            name == "admin"
                                ? Text(
                                    'Veja as consultas agendadas pelos pacientes: ',
                                    style: textoBotao())
                                : Text('Veja suas consultas: ',
                                    style: textoBotao()),
                            const SizedBox(height: 16),
                            Expanded(
                              child: Wrap(
                                spacing:
                                    16, // Espaçamento horizontal entre os widgets
                                runSpacing:
                                    16, // Espaçamento vertical entre as linhas
                                children: consultas.map((consulta) {
                                  return Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            text: "Data: ",
                                            style: GoogleFonts.nunito(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900),
                                            children: [
                                              TextSpan(
                                                  text: consulta.data,
                                                  style: texto())
                                            ],
                                          ),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: "Horário: ",
                                            style: GoogleFonts.nunito(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900),
                                            children: [
                                              TextSpan(
                                                  text: consulta.horario,
                                                  style: texto())
                                            ],
                                          ),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: "Nome: ",
                                            style: GoogleFonts.nunito(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900),
                                            children: [
                                              TextSpan(
                                                  text: consulta.idUser,
                                                  style: texto())
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        ElevatedButton(
                                          onPressed: () async {
                                            Provider.of<ConsultaController>(
                                                    context,
                                                    listen: false)
                                                .removeConsulta(
                                                    context, consulta.id!);
                                            // Atualiza a lista de consultas
                                            setState(() {
                                              consultaController
                                                  .fetchConsultas();
                                            });
                                          },
                                          child: Text('Cancelar',
                                              style: GoogleFonts.notoSans(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w900)),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          },
        ),
      ),
    );
  }
}
