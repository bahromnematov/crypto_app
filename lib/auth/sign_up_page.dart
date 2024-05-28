import 'package:crypto_app/main/instagram_home_page.dart';
import 'package:crypto_app/auth/sign_in_page.dart';
import 'package:crypto_app/service/auth_service.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController=TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

   _doSignUpUser(){
    String name=nameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    if(name.isNotEmpty&&email.isNotEmpty&&password.isNotEmpty){
      AuthService.signUpUser(name, email, password).then((value) => {
        Navigator.pushNamed(context, InstagramHomePage.id),
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
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "Name",
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
              _doSignUpUser();
            },
            child: Container(
              margin: EdgeInsets.all(12),
              height: 56,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Sign Up",
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
                      return SignInPage();
                    }));
                  },
                  child: Text(
                    "Sign In",
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
