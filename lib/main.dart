import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:questin/providers/home_router_provider.dart';
import 'package:questin/providers/profile_provider.dart';
import 'package:questin/providers/quest_provider.dart';
import 'package:questin/routes/home_router.dart';
import 'package:questin/screens/company_home_page.dart';
import 'package:questin/screens/login_page.dart';
import 'package:questin/screens/student_home_page.dart';
import 'package:questin/services/auth_service.dart';
import 'package:questin/services/quest_service.dart';
import 'package:questin/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://mdksztqofddekzneexgu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1ka3N6dHFvZmRkZWt6bmVleGd1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1OTMwNTcsImV4cCI6MjA4NTE2OTA1N30.zduDQEkH7Cq1mdXfAylG-YdjgN-c-YkvaVY-S74MNpE',
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    QuestProvider().loadquest();
    AuthService().logout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeRouterProvider()),
        ChangeNotifierProvider(create: (_) => QuestProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: LoginPage(),
      ),
    );
  }
}
