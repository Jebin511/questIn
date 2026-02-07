import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:questin/providers/quest_provider.dart';
import 'package:questin/screens/profile_screen.dart';
import 'package:questin/widgets/game_card.dart';

class StudentHomePage extends StatefulWidget {
  StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
@override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<QuestProvider>().loadquest(); 
    });
  }

  @override
  Widget build(BuildContext context) {
final questProvider = context.watch<QuestProvider>();
final quests = questProvider.quests;
    return Stack(
      children: [
        Positioned.fill(child: Image.asset('assets/black.png', fit: BoxFit.cover)),
        Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: Image.asset("assets/profile-avatar.png", scale: 18),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "HOME",
                style: TextStyle(fontFamily: 'Pixel', color: Colors.white),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 20),
                const SizedBox(height: kToolbarHeight + 10),
                GameCard(
                  child: Row(
                    children: [
                      Lottie.asset("assets/Target-2.json", height: 60),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "TODAY'S TOP QUEST",
                            style: TextStyle(
                              fontFamily: 'Pixel',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "....",
                            style: TextStyle(
                              fontFamily: 'Pixel',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 100),
                        ],
                      ),
                    ],
                  ),
                ),

                GameCard(
                  child: quests.isEmpty
                      ? Text(
                          "NO QUESTS FOR NOW",
                          style: TextStyle(
                            fontFamily: 'Pixel',
                            color: Colors.white,
                          ),
                        )
                      : SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: quests.length,
                            itemBuilder: (context, index) {
                              final quest = quests[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Text(
                                  quest['title'],
                                  style: TextStyle(fontFamily: 'Pixel'),
                                ),
                              );
                            },
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
