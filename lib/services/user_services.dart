import 'package:supabase_flutter/supabase_flutter.dart';

class UserServices {
  final supabase = Supabase.instance.client;
  Future<Map<String, dynamic>> getProfile() async {
    final userID = supabase.auth.currentUser!.id;
    final data = await supabase
        .from('profiles')
        .select()
        .eq('id', userID)
        .single();
    return data;
  }
}
