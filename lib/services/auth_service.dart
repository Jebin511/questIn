import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:questin/screens/student_home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<void> Signup({
  
    required String email, 
    required String password,
    required String bio,
    required String name,
    
  }) async {
    final data = await supabase.auth.signUp(email: email, password: password);
    final UserId = data.user!;
    await supabase.from('profiles').insert({
      'id': UserId.id,
      'name': name,
      'email':email,
      'role': 'student',
      'bio': bio,
      'avatar_url': 'nil',
      'created_at': DateTime.now().toString(),
    });
    
  }

  Future<void> SignIn({
    required String email,
    required String password,
    context,
  }) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
    
  }
}
