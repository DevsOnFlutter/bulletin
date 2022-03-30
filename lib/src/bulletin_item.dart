import 'package:flutter/material.dart';

class BulletinItem {
  Widget? icon;
  String text;
  VoidCallback? onTap;

  BulletinItem({
    this.icon,
    required this.text,
    required this.onTap,
  });
}
