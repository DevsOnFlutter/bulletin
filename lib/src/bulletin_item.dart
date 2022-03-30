import 'package:flutter/material.dart';

class BulletinItem {
  Widget? icon;
  String text;
  Function onTap;

  BulletinItem({
    this.icon,
    required this.text,
    required this.onTap,
  });
}
