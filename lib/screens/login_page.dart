import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:questin/routes/home_router.dart';
import 'package:questin/screens/signup_page.dart';
import 'package:questin/screens/student_home_page.dart';
import 'package:questin/services/auth_service.dart';
import 'package:questin/widgets/game_card.dart';
import 'package:questin/widgets/pixel_scaffold.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return PixelScaffold(
      child: Center(
        child: GameCard(
          child: Column(
            children: [
              Lottie.asset("assets/Target-2.json", height: 60),
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
              // Text(
              //   "Dont have an account ?",
              //   style: TextStyle(fontFamily: 'Pixel', color: Colors.white,fontSize: 12),
              // ),
              TextButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Text(
                  "Signup",
                  style: TextStyle(
                    fontFamily: 'Pixel',
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    if (emailcontroller.text.isEmpty &&
                        passcontroller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text(
                            "Please fill in the credentials",
                            style: TextStyle(
                              fontFamily: 'Pixel',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    } else {
                      await auth.SignIn(
                        email: emailcontroller.text.trim(),
                        password: passcontroller.text.trim(),
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomeRouter(),
                        ),
                      );
                    }
                  } on AuthException catch (e) {
                    if (e.message.toLowerCase().contains(
                      'invalid login credentials',
                    )) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text(
                            "Wrong email or password",
                            style: TextStyle(
                              fontFamily: 'Pixel',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    }
                  } catch (_) {
                    throw 'Login failed';
                  }
                },

                child: Text(
                  "Login",
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
