import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:questin/providers/home_router_provider.dart';
import 'package:questin/screens/company_home_page.dart';
import 'package:questin/screens/student_home_page.dart';

class HomeRouter extends StatelessWidget {
  const HomeRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeRouterProvider>();
    if (state.isloading) {
      state.loadProfile();
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (state.role == 'student') {
      return StudentHomePage();
    } else {
      return CompanyHomePage();
    }
  }
}
