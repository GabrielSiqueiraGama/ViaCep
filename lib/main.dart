import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importando o Provider
import 'Controllers/via_cep_controller.dart'; // O Controller
import 'View/home_page.dart'; // A HomeView

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CepController()), // Adicionando o CepController
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(), // Certifique-se de que a HomeView está corretamente configurada
      ),
    );
  }
}
