import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../app_config.dart';
import '../controllers/user_controller.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        title: Text("CADASTRAR-SE", style: textoAppBar()),
      ),
      body: Form(
        key: formKey,
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
                        "Cadastrar-se",
                        style: titulo(),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: 400,
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Informe seu e-mail';
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
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Informe sua senha';
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
                          if (formKey.currentState!.validate()) {
                            final UserController userController =
                                Provider.of<UserController>(context,
                                    listen: false);
                            userController.signUp(
                                context,
                                emailController.text,
                                passwordController.text);
                          }
                          emailController.clear();
                          passwordController.clear();
                        },
                        child: Text(
                          "CADASTRAR",
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
