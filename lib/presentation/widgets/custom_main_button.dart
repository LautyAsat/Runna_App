import 'package:flutter/material.dart';

@immutable
class MainButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MainButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 60,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.black),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ))
        ),
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18),)
      ),
    );
  }
}