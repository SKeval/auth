import 'package:auth/auth/Reqistration.dart';
import 'package:auth/auth/profile.dart';
import 'package:auth/auth/validation.dart';
import 'package:auth/common/appbar.dart';
import 'package:auth/common/space.dart';
import 'package:auth/common/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usercon = TextEditingController();
  TextEditingController passcon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apbar("Login Page"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shadowColor: Colors.black,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Please Sign in to continue",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  shadowColor: Colors.black,
                  elevation: 5,
                  child: txtinfo(
                      title: "EMAIL",
                      controller: usercon,
                      hint: "Enter Username",
                      keyboard: TextInputType.emailAddress),
                ),
                Card(
                  shadowColor: Colors.black,
                  elevation: 5,
                  child: txtinfo(
                      title: "Password",
                      controller: passcon,
                      privacy: true,
                      hint: "Enter Password",
                      keyboard: TextInputType.text),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (usercon.text == "test@gmail.com" &&
                                  passcon.text == "123456") {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const profile(
                                              data: {
                                                "email": "test@gmail.com",
                                                "Password": "123456"
                                              },
                                            )));
                              } else if (usercon.text == "test@gmail.com" &&
                                  passcon.text != "123456") {
                                txt(title: "Invalid Password");
                              } else if (usercon.text != "test@gmail.com" &&
                                  passcon.text == "123456") {
                                txt(title: "Invalid Email ID");
                              } else if (usercon.text != "test@gmail.com" &&
                                  passcon.text != "123456") {
                                txt(title: "Invalid Email ID & Password");
                              }
                            });
                          },
                          child: const Text(
                            "Login Here..!!",
                            style: TextStyle(fontSize: 15),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Registration()));
                          },
                          child: const Text(
                            "Register Here..!!",
                            style: TextStyle(fontSize: 15),
                          )),
                    ],
                  ),
                ),
                space(
                  h: 50,
                ),
                if (usercon.text == "test@gmail.com" &&
                    passcon.text == "123456")
                  txt(
                    title: "Login Successfully",
                    color: Colors.black12,
                  ),
                if (usercon.text == "test@gmail.com" &&
                    passcon.text != "123456")
                  txt(title: "Invalid Password"),
                if (usercon.text != "test@gmail.com" &&
                    passcon.text == "123456")
                  txt(title: "Invalid Email ID"),
                if (usercon.text != "test@gmail.com" &&
                    passcon.text != "123456")
                  txt(title: "Invalid Email ID & Password")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
