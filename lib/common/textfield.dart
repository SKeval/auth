import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class txtinfo extends StatefulWidget {
  String title;
  String? hint;
  TextInputType keyboard;
  bool privacy;
  TextEditingController controller;

  txtinfo(
      {Key? key,
      required this.title,
      this.hint,
      this.privacy = false,
      required this.controller,
      this.keyboard = TextInputType.text})
      : super(key: key);

  @override
  State<txtinfo> createState() => _txtinfoState();
}

// ignore: camel_case_types
class _txtinfoState extends State<txtinfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.privacy,
        keyboardType: widget.keyboard,
        decoration: InputDecoration(
          labelText: widget.title,
          hintText: widget.hint,
        ),
      ),
    );
  }
}
