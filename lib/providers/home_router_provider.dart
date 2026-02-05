import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class HomeRouterProvider extends ChangeNotifier {
  String? role;
  bool isloading = true;
  Future<void> loadProfile() async {
    final UserId = supabase.auth.currentUser!.id;
    final data = await supabase
        .from('profiles')
        .select()
        .eq('id', UserId)
        .single();
    role = data['role'];
    isloading = false;
    notifyListeners();
  }
}
