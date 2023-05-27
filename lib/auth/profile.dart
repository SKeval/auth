import 'package:auth/auth/login.dart';
import 'package:auth/common/appbar.dart';
import 'package:auth/common/profilerow.dart';
import 'package:auth/common/space.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  final Map<String, String> data;
  const profile({Key? key, required this.data}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apbar("Profile"),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Column(
            children: [
              txtrow(
                  title: "User Name : ",
                  value: widget.data["name"] != null
                      ? widget.data["name"]!
                      : "N/A"),
              txtrow(
                  title: "Password : ",
                  value: widget.data["password"] != null
                      ? widget.data["password"]!
                      : "123456"),
              txtrow(
                  title: "Email : ",
                  value: widget.data["email"] != null
                      ? widget.data["email"]!
                      : "text@gmail.com"),
              txtrow(
                  title: "Gender : ",
                  value: widget.data["Gender"] != null
                      ? widget.data["Gender"]!
                      : "N/A"),
              txtrow(
                  title: "Hobby : ",
                  value: widget.data["hobby"] != null
                      ? widget.data["hobby"]!
                      : "N/A"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ));
                  },
                  child: Text(
                    "Back to Login",
                    style: TextStyle(fontSize: 16),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
