import 'package:flutter/material.dart';
import 'package:flutter_dent_lab/app_config.dart';
import 'package:flutter_dent_lab/controllers/user_controller.dart';
import 'package:flutter_dent_lab/screens/admin_cadastro.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../controllers/consulta_controller.dart';
import '../models/consulta_model.dart';

class ConsultasList extends StatefulWidget {
  const ConsultasList({super.key});

  @override
  State<ConsultasList> createState() => _ConsultasListState();
}

class _ConsultasListState extends State<ConsultasList> {
  final user = UserController.name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          const Icon(FontAwesomeIcons.calendarDays, color: Colors.deepPurple),
          const SizedBox(width: 8),
          user == "admin" ? Text('Organize os horários disponíveis', style: textoBotao()): Text('Agende seu horário', style: textoBotao())
        ]),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ConsultaController>(
          builder: (context, consultaController, child) {
            return FutureBuilder<List<ConsultaModel>>(
              future: consultaController.fetchConsultas(),
              builder: (context, snapshot) {


                if (snapshot.hasData) {
                  List<ConsultaModel> consultas = snapshot.data!
                      .where((consulta) => consulta.idUser == 'disponivel')
                      .toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Horários disponíveis: ',
                        style: textoBotao(),
                      ),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                            text: consulta.data, style: texto())
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
                                  const SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () async {
                                      
                                      user == "admin"? await consultaController.removeConsulta(context, consulta.id!):
                                      await consultaController.agendarConsulta(
                                          context, consulta.id!, user!);
                                      // Atualiza a lista de consultas
                                      setState(() {
                                        consultaController.fetchConsultas();
                                      });
                                    },
                                    child: user == "admin"? Text('Excluir', style: textoBotaoVermelho()): Text('Agendar', style: textoBotao()),
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
      floatingActionButton: user == "admin"
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return AdminCadastro();
                  },
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
