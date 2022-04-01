import 'package:flutter/material.dart';

class BulletinItem {
  /// Icon of the bulletin
  final Widget? icon;

  /// Text of the bulletin
  final String text;

  /// Text style of the bulletin
  final TextStyle? textStyle;

  /// Function called onTap to bulletin
  final VoidCallback? onTap;

  /// Bulletin Item
  BulletinItem({
    required this.text,
    required this.onTap,
    this.icon,
    this.textStyle,
  });
}
