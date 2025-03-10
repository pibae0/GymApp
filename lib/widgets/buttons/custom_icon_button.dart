import 'package:flutter/material.dart';
import 'package:gym_project/utils/app_style.dart';

class CustomIconButton extends StatelessWidget {
  final Function() onTap;
  final IconData icon;

  const CustomIconButton({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      color: AppTheme.accent,
      disabledColor: AppTheme.medium,
      splashRadius: 10,
      icon: Icon(icon),
    );
  }
}
