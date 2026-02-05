import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:questin/screens/student_home_page.dart';
import 'package:questin/services/auth_service.dart';
import 'package:questin/widgets/game_card.dart';
import 'package:questin/widgets/pixel_scaffold.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final name = TextEditingController();
  final bio = TextEditingController();
  final auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return PixelScaffold(
      child: Center(
        child: GameCard(
          child: Column(
            children: [
              Lottie.asset("assets/Target-2.json",height: 60),
              Text(
                "QuestIn",
                style: TextStyle(
                  fontFamily: 'Pixel',
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    fontFamily: 'Pixel',
                    color: Colors.white,
                  ),
                ),
                controller: name,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Bio',
                  labelStyle: TextStyle(
                    fontFamily: 'Pixel',
                    color: Colors.white,
                  ),
                ),
                controller: bio,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontFamily: 'Pixel',
                    color: Colors.white,
                  ),
                ),
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontFamily: 'Pixel',
                    color: Colors.white,
                  ),
                ),
                controller: passcontroller,
                obscureText: true,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  try {
                    auth.Signup(
                      email: emailcontroller.text.trim(),
                      password: passcontroller.text.trim(),
                      bio: bio.text,
                      name: name.text,
                    );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => StudentHomePage(),
                      ),
                    );
                  } catch (error) {
                    print(error);
                  }
                },
                child: Text(
                  "Signup",
                  style: TextStyle(fontFamily: 'Pixel', color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
