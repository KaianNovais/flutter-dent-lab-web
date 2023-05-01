import 'package:flutter/material.dart';
import 'package:flutter_dent_lab/app_config.dart';
import 'package:flutter_dent_lab/custom_widgets/custom_appBar.dart';
import 'package:flutter_dent_lab/custom_widgets/custom_card.dart';
import 'package:flutter_dent_lab/custom_widgets/custom_cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _sectionOneKey = GlobalKey();
  final _sectionTwoKey = GlobalKey();
  final _sectionThreeKey = GlobalKey();

  Future<void> _scrollToSection(GlobalKey key) async {
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //navBar
      appBar: CustomAppBar(
        logo: Row(
          children: [
            //logo da Nav
            Image.asset("images/logo.png"),
            //texto que acompanha a logo
            Text(
              " Dent",
              style: GoogleFonts.lobster(
                  fontSize: 32, fontWeight: FontWeight.w900),
            ),
            Text(
              " lab",
              style: GoogleFonts.lobster(
                  fontSize: 32,
                  color: Colors.blue,
                  fontWeight: FontWeight.w900),
            )
          ],
        ),
        //links da nav
        navigationLinks: [
          TextButton(
              onPressed: () => _scrollToSection(_sectionOneKey),
              child: Text("SOBRE", style: textoAppBar())),
          TextButton(
            onPressed: () => _scrollToSection(_sectionTwoKey),
            child: Text("SERVIÇOS", style: textoAppBar()),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_sectionThreeKey),
            child: Text("PROFISSIONAIS", style: textoAppBar()),
          ),
          TextButton(
            onPressed: () => context.go('/login'),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: Text(
                "LOGIN",
                style: textoAppBar(),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          //Primeiro container que contém a imagem da paciente, juntamente com o título principal
          SizedBox(
            width: double.infinity,
            height: 800,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 600,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //titulo principal, cujo objetivo é impactar o usuário
                          Text(
                            "Nós nos importamos",
                            style: titulo(),
                          ),
                          Text(
                            "com o seu sorriso",
                            style: titulo(),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Com mais de 1000 clientes atendidos",
                            style: texto(),
                          ),
                          Text(
                            "somos referência absoluta",
                            style: texto(),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          //botão pra chamar a atenção do usuário
                          ElevatedButton(
                            onPressed: () => context.go('/register'),
                            child: Text(
                              "TENHO INTERESSE",
                              style: textoBotao(),
                            ),
                          )
                        ],
                      ),
                      //foto principal
                      Image.asset("images/fotoPrincipal.png")
                    ],
                  ),
                ),
                //container para destacar as principais vantagens da clínica
                Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      CustomCard(
                          color: CustomColors.colorLaranja,
                          title: 'Atendimento de qualidade',
                          subtitle:
                              "Nossa prioridade sempre será atendê-lo bem.",
                          imageUrl: "images/Atendimento.png"),
                      CustomCard(
                          color: CustomColors.colorRoxa,
                          title: 'Profissionais experientes',
                          subtitle:
                              "Dispomos de uma equipe altamente qualificada.",
                          imageUrl: "images/adicao.png"),
                      CustomCard(
                          color: CustomColors.colorAmarelo,
                          title: 'Nota máxima',
                          subtitle:
                              "Nossa central de atendimento obteve nota máxima por 5 anos consecutivos.",
                          imageUrl: "images/estrelas.png"),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Visibility(
            
            key: _sectionOneKey,
            
            child: Row(
              children: [
                Image.asset(
                  "images/servicos.png",
                  width: 700,
                  height: 700,
                ),
                //container destacando as razões pelas quais devemos escolher a clínica
                SizedBox(
                  width: 700,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Há muitas razões para nos escolher",
                        style: titulo(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Velocidade:',
                              style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: const Color.fromRGBO(65, 212, 201, 1),
                              ),
                            ),
                            TextSpan(
                                text:
                                    ' Somos rápidos e ágeis em nossos procedimentos. Sorria com confiança! Cuide da sua saúde bucal com nossa equipe experiente e tecnologia de ponta.',
                                style: texto()),
                          ],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Simplicidade:',
                              style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: CustomColors.colorAzulEscuro,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' Invista em seu sorriso e colha os benefícios de uma vida mais feliz e saudável! Agende sua consulta agora mesmo! Nossos especialistas utilizam as mais recentes técnicas e equipamentos para garantir o melhor resultado possível.',
                              style: texto(),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Qualidade:',
                              style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: CustomColors.colorAzulClaro,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' Seu sorriso merece o melhor! No nosso Consultório Odontológico, nossa missão é proporcionar um atendimento odontológico excepcional, tornando seu sorriso mais brilhante e saudável.',
                              style: texto(),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: 300,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () => context.go('/register'),
                          child: Text(
                            "TENHO INTERESSE",
                            style: textoBotao(),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          //título dos serviços principais
          Visibility(
            key: _sectionTwoKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Conheça nossos serviços principais",
                  style: titulo(),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          //Lista com os principais serviços ofertados
          SizedBox(
            height: 400,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              spacing: 30,
              children: const [
                CustomCardGeral(
                    title: "Clareamento",
                    subtitle:
                        "Melhoria da aparência dos dentes e do sorriso, através de clareamento, facetas, restaurações estéticas e outros procedimentos.",
                    imageUrl: "images/clareamento.png"),
                CustomCardGeral(
                    title: "Consulta",
                    subtitle:
                        "Avaliação geral da saúde bucal, histórico médico, detecção de problemas e planejamento do tratamento adequado.",
                    imageUrl: "images/consulta.png"),
                CustomCardGeral(
                    title: "Extração",
                    subtitle:
                        "Remoção de dentes danificados, impactados ou que não podem ser salvos por outros tratamentos.",
                    imageUrl: "images/extracao.png"),
                CustomCardGeral(
                    title: "Aparelho",
                    subtitle:
                        "Correção de problemas de oclusão e alinhamento dos dentes, utilizando aparelhos ortodônticos fixos ou removíveis.",
                    imageUrl: "images/aparelho.png"),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(90),
            width: double.infinity,
            height: 700,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(239, 248, 254, 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //container falando um pouco sobre os profissioais da clínica
                Visibility(
                  key: _sectionThreeKey,
                  child: SizedBox(
                    width: 700,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nossos profissionais",
                          style: titulo(),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Você merece o sorriso mais radiante, e nós temos a equipe perfeita para tornar isso possível! Bem-vindo à nossa clínica odontológica, onde a saúde, o bem-estar e a beleza do seu sorriso são a nossa maior prioridade. Nossos dentistas altamente qualificados e experientes estão aqui para proporcionar um atendimento excepcional e personalizado, garantindo resultados de tirar o fôlego.",
                          style: texto(),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.faceSmile,
                              color: Colors.deepPurple,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Profissionais qualificados",
                              style: GoogleFonts.nunito(
                                fontSize: 18,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.faceGrinStars,
                              color: Colors.deepPurple,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Profissionais experientes",
                              style: GoogleFonts.nunito(
                                fontSize: 18,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: 300,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () => context.go('/register'),
                            child: Text(
                              "TENHO INTERESSE",
                              style: textoBotao(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  "images/dentista.png",
                  width: 400,
                )
              ],
            ),
          ),
          //footer
          Container(
            color: const Color.fromRGBO(9, 29, 64, 1),
            width: double.infinity,
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        //logo da Nav
                        Image.asset(
                          "images/logo.png",
                          width: 72,
                          height: 72,
                        ),
                        //texto que acompanha a logo
                        Text(
                          " Dent",
                          style: GoogleFonts.lobster(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          " lab",
                          style: GoogleFonts.lobster(
                              fontSize: 32,
                              color: Colors.blue,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.locationDot,
                            color: Colors.blue),
                        const SizedBox(width: 10),
                        Text("Osasco - SP", style: tituloFooter())
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.phone,
                            color: Colors.blue),
                        const SizedBox(width: 10),
                        Text("(33) 9 9956-7070", style: tituloFooter())
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text("Navegue em:", style: tituloFooter()),
                    TextButton(
                        onPressed: () {},
                        child: Text("Sobre", style: textoFooter())),
                    TextButton(
                        onPressed: () {},
                        child: Text("Serviços", style: textoFooter())),
                    TextButton(
                        onPressed: () {},
                        child: Text("Especialista", style: textoFooter())),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text("Serviços principais:", style: tituloFooter()),
                    TextButton(
                        onPressed: () {},
                        child: Text("Clareamento", style: textoFooter())),
                    TextButton(
                        onPressed: () {},
                        child: Text("Extração", style: textoFooter())),
                    TextButton(
                        onPressed: () {},
                        child: Text("Aparelho", style: textoFooter())),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
