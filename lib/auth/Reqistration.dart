import 'package:auth/auth/profile.dart';
import 'package:auth/common/textfield.dart';
import 'package:flutter/material.dart';

import 'package:auth/common/appbar.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController namecon = TextEditingController();
  TextEditingController emailcon = TextEditingController();
  TextEditingController pswcon = TextEditingController();
  String value1 = "";
  List<String> hobby = ["Play", "Read", "Sing"];
  List<String> checkHobby = [];

  Widget gender({required String value}) {
    return Radio(
        value: value,
        groupValue: value1,
        onChanged: (val) {
          setState(() {
            value1 = val.toString();
          });
        });
  }

  Widget check(bool isagree, String title) {
    return Checkbox(
        value: isagree,
        onChanged: (val) {
          setState(() {});
          val! ? checkHobby.add(title) : checkHobby.remove(title);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apbar("Registration Page"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shadowColor: Colors.black,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Registration Here..!",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  txtinfo(
                      title: "UserName",
                      controller: namecon,
                      hint: "Enter your Username",
                      keyboard: TextInputType.text),
                  txtinfo(
                      title: "Password",
                      controller: pswcon,
                      hint: "Enter your Password",
                      privacy: true,
                      keyboard: TextInputType.text),
                  txtinfo(
                      title: "Email",
                      controller: emailcon,
                      hint: "Enter your Email",
                      keyboard: TextInputType.emailAddress),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Hobby : ",
                          style: TextStyle(fontSize: 16),
                        ),
                        check(checkHobby.contains(hobby[0]), hobby[0]),
                        Text(
                          hobby[0],
                          style: const TextStyle(fontSize: 16),
                        ),
                        check(checkHobby.contains(hobby[1]), hobby[1]),
                        Text(
                          hobby[1],
                          style: const TextStyle(fontSize: 16),
                        ),
                        check(checkHobby.contains(hobby[2]), hobby[2]),
                        Text(
                          hobby[2],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Gender : ",
                          style: TextStyle(fontSize: 16),
                        ),
                        gender(value: "male"),
                        const Text(
                          "Male",
                          style: TextStyle(fontSize: 16),
                        ),
                        gender(value: "Female"),
                        const Text(
                          "Female",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        String strHobby = "";
                        for (var item in checkHobby) {
                          strHobby += "$item, ";
                        }

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => profile(
                                      data: {
                                        "name": namecon.text.trim(),
                                        "password": pswcon.text.trim(),
                                        "email": emailcon.text.trim(),
                                        "Gender": value1.trim(),
                                        "hobby": strHobby
                                      },
                                    )));
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 16),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
