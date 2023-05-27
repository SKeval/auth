import 'package:flutter/material.dart';

class txt extends StatefulWidget {
  String title;
  Color color;
  txt({Key? key, required this.title, this.color = Colors.red})
      : super(key: key);

  @override
  State<txt> createState() => _txtState();
}

class _txtState extends State<txt> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: TextStyle(
        color: widget.color,
      ),
    );
  }
}
