import 'package:crypto_app/auth/instagram_home_page.dart';
import 'package:crypto_app/auth/sign_up_page.dart';
import 'package:crypto_app/service/auth_service.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  static final String id = "signin_page";

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void doLogin() {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    if (email.isNotEmpty && password.isNotEmpty) {
      AuthService.signInUser(email, password).then((value) => {
            Navigator.pushReplacementNamed(context, InstagramHomePage.id),
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              "Instagram",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Billabong",
                  fontSize: 60,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 12),
            margin: EdgeInsets.all(12),
            height: 56,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.22),
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "Phone Number or email",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 12),
            margin: EdgeInsets.all(12),
            height: 56,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.22),
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          InkWell(
            onTap: () {
              doLogin();
            },
            child: Container(
              margin: EdgeInsets.all(12),
              height: 56,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return SignUpPage();
                    }));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
