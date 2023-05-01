import 'package:flutter/material.dart';
import 'package:flutter_dent_lab/app_config.dart';
import 'package:flutter_dent_lab/controllers/consulta_controller.dart';
import 'package:provider/provider.dart';

class AdminCadastro extends StatelessWidget {
  AdminCadastro({super.key});
  final data = TextEditingController();
  final horario = TextEditingController();
  final descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Adicone novas datas e horários: ", style: textoBotao()),
          Container(
            width: 400,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: horario,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Informe um horário";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Horário',
                    hintText: 'Informe o horário disponível',
                    prefixIcon: Icon(Icons.timelapse_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: data,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Informe uma data";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Data',
                    hintText: 'Informe a data disponivel',
                    prefixIcon: Icon(Icons.date_range),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                 TextFormField(
                  controller: descricao,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Informe uma descrição";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Descrição',
                    hintText: 'Informe se está disponível',
                    prefixIcon: Icon(Icons.text_decrease),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ConsultaController>(context, listen: false).cadastrarConsulta(context, descricao.text, data.text, horario.text);
                    data.clear();
                    horario.clear();
                    descricao.clear();
                    Navigator.pop(context);
                  },
                  child: Text('Adicionar data', style: textoBotao()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
