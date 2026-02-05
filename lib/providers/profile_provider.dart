import 'package:flutter/material.dart';
import 'package:questin/services/profile_service.dart';

class ProfileProvider extends ChangeNotifier {
  Map<String, dynamic>? map;
  bool isLoading = true;

  Future<void> loadprofile() async {
     map = await ProfileService().fetchprofile();
    isLoading = false;
    notifyListeners();
    
  }
Future<void> updateAvatar() async {
  final url = await ProfileService().imageinsert();

  if (url != null) {
    map!['avatar_url'] = url;
    notifyListeners();
  }
}
  
}
