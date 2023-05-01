import 'package:flutter/material.dart';
import 'package:flutter_dent_lab/screens/boletos_list.dart';
import 'package:flutter_dent_lab/screens/consulta_list.dart';
import 'package:flutter_dent_lab/screens/consulta_list_user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _selectedIndex = 0;
  List pages = [
    const ConsultasList(),
    const ConsultasListUser(),
    const BoletoList(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
              extended: true,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.none,
              backgroundColor: Colors.deepPurple[300],
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: const FaIcon(FontAwesomeIcons.calendar),
                  selectedIcon: const FaIcon(FontAwesomeIcons.calendarDay,
                      color: Colors.black),
                  label: Text('Agendar',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ),
                NavigationRailDestination(
                  icon: const FaIcon(FontAwesomeIcons.stethoscope),
                  selectedIcon: const FaIcon(FontAwesomeIcons.stethoscope,
                      color: Colors.black),
                  label: Text('Consultas',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ),
                NavigationRailDestination(
                  icon: const FaIcon(FontAwesomeIcons.dollarSign),
                  selectedIcon: const FaIcon(FontAwesomeIcons.moneyBill,
                      color: Colors.green),
                  label: Text('Pagamentos',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ),
                NavigationRailDestination(
                    icon: IconButton(
                        onPressed: () => context.go('/'),
                        icon: const FaIcon(FontAwesomeIcons.rightFromBracket)),
                    label: TextButton(
                        onPressed: () => context.go('/'),
                        child: Text('Sair',
                            style: GoogleFonts.nunitoSans(
                              color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)))),
              ],
              unselectedIconTheme: const IconThemeData(color: Colors.black),
              selectedLabelTextStyle: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w900)),
          Expanded(
            child: Container(
              child: pages[_selectedIndex],
            ),
          )
        ],
      ),
    );
  }
}
