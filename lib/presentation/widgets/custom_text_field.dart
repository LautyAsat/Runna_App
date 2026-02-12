import 'package:flutter/material.dart';

class RunnaInput extends StatelessWidget {
  final String label;
  final String hint;
  final bool? obscureText;
  final TextEditingController controller;

  const RunnaInput({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall,),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: TextField(
            controller: controller,
            obscureText: obscureText ?? false,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              labelText: hint,
              floatingLabelBehavior: FloatingLabelBehavior.never
            ),
          ),
        ),
      ]
    );
  }
}