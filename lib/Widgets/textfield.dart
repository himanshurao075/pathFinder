import 'package:flutter/material.dart';
import 'package:path_finder/Utils/colors.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
        required this.label,
        this.hint,
        required this.onChanged,
        this.controller});

  final String label;
  final String? hint;
  final TextEditingController? controller;
  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: NewCustomColorPlatte().headingColor),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: NewCustomColorPlatte().blueColor.withOpacity(0.1)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: controller,
                    onChanged: (val) {
                      onChanged(val);
                    },
                    decoration: InputDecoration(
                        hintText: hint,
                        border: InputBorder.none,
                        focusColor: Colors.lightBlue.shade50,
                        hoverColor: Colors.lightBlue.shade50,
                        fillColor: Colors.lightBlue.shade50),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

