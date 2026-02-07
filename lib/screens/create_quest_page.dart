import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:questin/providers/quest_provider.dart';
import 'package:questin/services/quest_service.dart';
import 'package:questin/widgets/game_card.dart';
import 'package:questin/widgets/pixel_scaffold.dart';

class CreateQuestPage extends StatefulWidget {
  const CreateQuestPage({super.key});

  @override
  State<CreateQuestPage> createState() => _CreateQuestPageState();
}

class _CreateQuestPageState extends State<CreateQuestPage> {
  final titlecontroller = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PixelScaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: GameCard(
          child: Column(
            children: [
              TextField(
                controller: titlecontroller,
                decoration: InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 4,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await context.read<QuestProvider>().uploadquest(
                      title: titlecontroller.text,
                      description: descController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          'Quest posted Successfully 🎉',
                          style: TextStyle(
                            fontFamily: 'Pixel',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                    Navigator.of(context).pop();
                  } catch (error) {
                    print(error);
                  }
                },
                child: const Text("POST QUEST"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
