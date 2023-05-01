import 'package:flutter/material.dart';
import 'package:flutter_dent_lab/controllers/user_controller.dart';
import 'package:provider/provider.dart';

import 'controllers/consulta_controller.dart';
import 'routes.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserController()),
        ChangeNotifierProvider(create: (context) => ConsultaController()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme:
            ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      ),
    );
  }
}
