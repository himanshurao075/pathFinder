import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    this.btnLabel = "Submit",
    this.btnColor,
    this.btnRadius,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String btnLabel;
  final Color? btnColor;
  final double? btnRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(btnRadius ?? 30),
        ),
        backgroundColor: btnColor ?? Colors.pink,
      ),
      child: Text(
        btnLabel,
      ),
    );
  }
}

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    Key? key,
    required this.onPressed,
    this.icon = Icons.arrow_downward_sharp,
    this.btnColor,
    this.btnRadius,
    this.btnLabel="Next",
  }) : super(key: key);
  final VoidCallback? onPressed;
  final IconData icon;
  final Color? btnColor;
  final double? btnRadius;
  final String btnLabel;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: btnColor,
      icon: Icon(icon),
      label:Text(btnLabel),
    );
  }
}
