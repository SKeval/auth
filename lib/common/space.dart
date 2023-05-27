import 'package:flutter/material.dart';

class space extends StatelessWidget {
  double h;
  space({Key? key, this.h = 2.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
    );
  }
}
