import 'package:auth/common/space.dart';
import 'package:flutter/material.dart';

class txtrow extends StatefulWidget {
  String title;
  String value;
  txtrow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  State<txtrow> createState() => _txtrowState();
}

// ignore: camel_case_types
class _txtrowState extends State<txtrow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 16),
            ),
            Expanded(flex: 1, child: Container()),
            Expanded(
              child: Text(
                widget.value,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        space(
          h: 30,
        )
      ],
    );
  }
}
