import 'package:flutter/material.dart';
import 'package:questin/screens/create_quest_page.dart';
import 'package:questin/services/quest_service.dart';

class CompanyHomePage extends StatelessWidget {
  const CompanyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Text("➕ New Quest"),
      onPressed: () {
       Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CreateQuestPage()),
    );
      },
    );
  }
}
