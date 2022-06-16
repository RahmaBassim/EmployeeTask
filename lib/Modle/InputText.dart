import 'package:flutter/material.dart';


class InputText extends StatelessWidget {
  final String Input;
  final double Size;
  final Color TextColor;
  final FontWeight;

  const InputText({super.key,
    required this.Input,
    required this.Size,
    required this.TextColor,
    this.FontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      Input,
      softWrap: true,
      style: TextStyle(
        color: TextColor,
        fontWeight: FontWeight,
        fontSize: Size,
      ),
    );
  }
}
