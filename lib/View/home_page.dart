import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controllers/via_cep_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final cepController = Provider.of<CepController>(context);
    final TextEditingController cepControllerText = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cepControllerText,
              decoration: const InputDecoration(
                labelText: 'Digite o CEP',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final cep = cepControllerText.text;
                if (cep.isNotEmpty) {
                  cepController.fetchCep(cep);
                }
              },
              child: const Text('Pesquisar'),
            ),
            const SizedBox(height: 16),
            cepController.error.isNotEmpty
                ? Text(cepController.error, style: const TextStyle(color: Colors.red))
                : cepController.cepModel != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Logradouro: ${cepController.cepModel?.logradouro}'),
                          Text('Bairro: ${cepController.cepModel?.bairro}'),
                          Text('Cidade: ${cepController.cepModel?.localidade}'),
                          Text('UF: ${cepController.cepModel?.uf}'),
                        ],
                      )
                    : Container(),
          ],
        ),
      ),
    );
  }
}