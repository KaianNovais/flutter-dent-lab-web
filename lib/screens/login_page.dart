import 'package:flutter/material.dart';
import 'package:flutter_dent_lab/app_config.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../controllers/user_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        title: Text("LOGIN", style: textoAppBar()),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.01,
                0.51,
                1.0,
              ],
              colors: [
                Color.fromRGBO(213, 228, 254, 1),
                Color.fromRGBO(214, 236, 242, 1),
                Color.fromRGBO(211, 244, 231, 1),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //logo da Nav
                    Image.asset(
                      "images/logo.png",
                      width: 96,
                      height: 96,
                    ),
                    //texto que acompanha a logo
                    Text(
                      " Cuidamos do seu",
                      style: GoogleFonts.lobster(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      " sorriso",
                      style: GoogleFonts.lobster(
                          fontSize: 32,
                          color: Colors.blue,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //foto principal
                  Image.asset("images/fotoPrincipal.png"),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //titulo principal, cujo objetivo é impactar o usuário
                      Text(
                        "Login",
                        style: titulo(),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: 400,
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Informe seu e-mail";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'E-mail',
                            hintText: 'Informe seu e-mail',
                            prefixIcon: Icon(Icons.account_circle),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: 400,
                        child: TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Informe sua senha";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            hintText: 'Informe sua senha',
                            prefixIcon: Icon(Icons.password_rounded),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),
                      //botão pra chamar a atenção do usuário
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final isSucess = await Provider.of<UserController>(
                                    context,
                                    listen: false)
                                .signIn(context, _emailController.text,
                                    _passwordController.text);
                            UserController.name = _emailController.text;
                            _emailController.clear();
                            _passwordController.clear();
                            if (!isSucess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('Usuário não encontrado!'),
                                ),
                              );
                            }
                          }
                        },
                        child: Text(
                          "ENTRAR",
                          style: textoBotao(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
