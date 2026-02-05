import 'dart:io';
import 'dart:math';

import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileService {
  final supabase = Supabase.instance.client;
  final picker = ImagePicker();
  Future<Map<String, dynamic>> fetchprofile() async {
    final userId = supabase.auth.currentUser!.id;
    final data = await supabase
        .from('profiles')
        .select()
        .eq('id', userId)
        .single();
    return data;
  }

  Future<String?> imageinsert() async {
    final userid = supabase.auth.currentUser!.id;
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    final file = File(image.path);
    final path = 'avatars/$userid.png';
    await supabase.storage
        .from('avatars')
        .upload(path, file, fileOptions: const FileOptions(upsert: true));
    final url = supabase.storage.from('avatars').getPublicUrl(path);
    await supabase
        .from('profiles')
        .update({'avatar_url': url})
        .eq('id', userid);
    return url;
  }
}
