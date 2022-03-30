import 'dart:async';

import 'package:bulletin/src/bulletin_item.dart';
import 'package:flutter/material.dart';

class Bulletin extends StatefulWidget {
  const Bulletin({
    Key? key,
    this.children = const [],
    this.icon,
    this.height,
    this.width,
    this.backgroundColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeIn,
  }) : super(key: key);

  /// The List of BulletinItems.
  final List<BulletinItem> children;

  /// The const icon for the bulletin.
  /// If this is null, the icon property of bulletin item will be used.
  final Widget? icon;

  /// The background color of the bulletin.
  final Color? backgroundColor;

  /// The height of the bulletin.
  final double? height;

  /// The width of the bulletin.
  final double? width;

  /// The border radius of the bulletin.
  final BorderRadius borderRadius;

  /// The duration of the animation.
  final Duration duration;

  ///Fade in curve. Defaults to [Curves.easeIn].
  final Curve curve;

  @override
  State<Bulletin> createState() => _BulletinState();
}

class BulletinController {}

class _BulletinState extends State<Bulletin> with TickerProviderStateMixin {
  late AnimationController _controller;
  late ValueNotifier<int> index;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    index = ValueNotifier<int>(0);
    _setupCurve();
    fadeIn();
  }

  void _setupCurve() {
    final curve = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(curve).addStatusListener((status) {
      if (widget.children.length > 1) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(seconds: 3), () {
            _controller.reset();
            if (index.value == widget.children.length - 1) {
              index.value = 0;
            } else {
              index.value++;
            }
            fadeIn();
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.01,
      ),
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
        top: screenHeight * 0.01,
        bottom: screenHeight * 0.01,
      ),
      child: ValueListenableBuilder<int>(
          valueListenable: index,
          builder: (context, snapshot, child) {
            return Row(
              children: [
                if (widget.icon != null) widget.icon ?? const SizedBox.shrink(),
                SizedBox(width: screenWidth * 0.05),
                SizedBox(
                  width: screenWidth * 0.6,
                  child: FadeTransition(
                    opacity: _controller,
                    child: Text(
                      widget.children[snapshot].text,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: screenHeight * 0.015,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
        borderRadius: widget.borderRadius,
      ),
    );
  }

  void fadeIn() {
    _controller.forward();
  }

  void fadeOut() {
    _controller.reverse();
  }
}
