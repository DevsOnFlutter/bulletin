import 'package:flutter/material.dart';

class BulletinItem {
  Widget? icon;
  String text;
  TextStyle? textStyle;
  VoidCallback? onTap;

  BulletinItem({
    this.icon,
    required this.text,
    this.textStyle,
    required this.onTap,
  });
}
