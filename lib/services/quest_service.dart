import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class QuestService {
  static Future<void> createQuest({
    required String title,
    required String description,
  }) async {
    final userId = supabase.auth.currentUser!.id;
    await supabase.from('quests').insert({
      'company_id': userId,
      'title': title,
      'description': description,
    });
  }

  static Future<List<Map<String, dynamic>>> fetchquests() async {
    final data = supabase
        .from('quests')
        .select()
        .order('created_at', ascending: false);
    return data;
  }

static Future<void> updateQuestStatus({
  required String questId,
  required String status,
}) async {
  await supabase
      .from('quests')
      .update({'status': status})
      .eq('id', questId);
}
}
