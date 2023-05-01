import 'package:flutter/material.dart';
import 'package:flutter_dent_lab/screens/admin_page.dart';
import 'package:flutter_dent_lab/screens/home_page.dart';
import 'package:flutter_dent_lab/screens/login_page.dart';
import 'package:flutter_dent_lab/screens/register_page.dart';
import 'package:flutter_dent_lab/screens/user_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return const Register();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/userPage',
      builder: (BuildContext context, GoRouterState state) {
        return const UserPage();
      },
    ),
    GoRoute(
      path: '/adminPage',
      builder: (BuildContext context, GoRouterState state) {
        return const AdminPage();
      },
    ),
  ],
);
