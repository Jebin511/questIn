import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:questin/providers/profile_provider.dart';
import 'package:questin/widgets/game_card.dart';
import 'package:questin/widgets/pixel_scaffold.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProfileProvider>().loadprofile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();

    if (profileProvider.isLoading || profileProvider.map == null) {
      return  Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final profile = profileProvider.map!;

    return PixelScaffold(
      appBar: AppBar(title: const Text("👤 PROFILE")),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GameCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                onTap: () {
                  context.read<ProfileProvider>().updateAvatar();
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  backgroundImage: profile['avatar_url'] != null
                      ? NetworkImage(profile['avatar_url'])
                      : null,
                  child: profile['avatar_url'] == null
                      ? const Icon(Icons.add_a_photo)
                      : null,
                ),
              ),
              ),
              const SizedBox(height: 20),

              Text(
                "Username: ${profile['name']}",
                style: const TextStyle(
                  fontFamily: 'Pixel',
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Bio: ${profile['bio']}",
                style: const TextStyle(
                  fontFamily: 'Pixel',
                  color: Colors.white,
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}