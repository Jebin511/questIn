import 'package:flutter/material.dart';
import 'package:questin/services/quest_service.dart';

class QuestProvider extends ChangeNotifier {
  List<Map<String, dynamic>> quests = [];
  String? quest;

  bool isLoading = true;
  Future<void> loadquest() async {
    quests = await QuestService.fetchquests();
    isLoading = false;
    notifyListeners();
  }

  Future<void> uploadquest({
    required String title,
    required String description,
  }) async {
    await QuestService.createQuest(title: title, description: description);
  }

  Future<void> statusupdate({
    required String questid,
    required String status,
  }) async {
    await QuestService.updateQuestStatus(questId: questid, status: status);
  }
  Future<void> toggleStatus({
  required String questId,
  required String currentStatus,
}) async {
  final newStatus =
      currentStatus == 'active' ? 'inactive' : 'active';

  await QuestService.updateQuestStatus(
    questId: questId,
    status: newStatus,
  );

  await loadquest(); 
}
}
