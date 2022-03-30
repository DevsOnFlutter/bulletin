import 'dart:async';

import 'package:bulletin/src/bulletin_item.dart';
import 'package:flutter/material.dart';

class Bulletin extends StatefulWidget {
  const Bulletin({
    Key? key,
    this.children = const [],
    this.icon,
    this.bulletinWidth,
    this.bulletinHeight,
    this.backgroundColor = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(9)),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeIn,
    this.closeButton,
    this.onCloseIconColor = Colors.white,
    this.onCloseBackGroundColor = Colors.black,
    this.onClose,
  }) : super(key: key);

  /// The List of BulletinItems.
  final List<BulletinItem> children;

  /// The const icon for the bulletin.
  /// If this is null, the icon property of bulletin item will be used.
  final Widget? icon;

  /// The background color of the bulletin.
  final Color backgroundColor;

  /// The height of the bulletin.
  final double? bulletinHeight;

  /// The width of the bulletin.
  final double? bulletinWidth;

  /// The border radius of the bulletin.
  final BorderRadius borderRadius;

  /// The duration of the animation.
  final Duration duration;

  /// Fade in curve. Defaults to [Curves.easeIn].
  final Curve curve;

  /// The onCloseButton Widget
  final Widget? closeButton;

  /// The onClose Button icon Color
  final Color onCloseIconColor;

  /// The onClose Button background Color
  final Color onCloseBackGroundColor;

  /// The callback when the bulletin is closed.
  final VoidCallback? onClose;

  @override
  State<Bulletin> createState() => _BulletinState();
}

class _BulletinState extends State<Bulletin> with TickerProviderStateMixin {
  late AnimationController _controller;
  late ValueNotifier<int> index;
  late ValueNotifier<bool> isClosed;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    index = ValueNotifier<int>(0);
    isClosed = ValueNotifier<bool>(false);
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
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;

    final double _height = widget.bulletinHeight ?? _screenHeight;
    final double _width = widget.bulletinWidth ?? _screenWidth;

    return ValueListenableBuilder<bool>(
      valueListenable: isClosed,
      builder: (context, snapshot, child) {
        if (snapshot) {
          return const SizedBox.shrink();
        }
        return Stack(
          children: [
            GestureDetector(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: _width * 0.05,
                  vertical: _height * 0.01,
                ),
                padding: EdgeInsets.only(
                  left: _width * 0.05,
                  right: _width * 0.05,
                  top: _height * 0.015,
                  bottom: _height * 0.015,
                ),
                child: ValueListenableBuilder<int>(
                    valueListenable: index,
                    builder: (context, snapshot, child) {
                      return GestureDetector(
                        child: Row(
                          children: [
                            if (widget.icon != null)
                              widget.icon ?? const SizedBox.shrink(),
                            SizedBox(width: _screenWidth * 0.05),
                            SizedBox(
                              width: _screenWidth * 0.6,
                              child: FadeTransition(
                                opacity: _controller,
                                child: Text(
                                  widget.children[snapshot].text,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: _screenHeight * 0.015,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: widget.children[snapshot].onTap,
                      );
                    }),
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: widget.borderRadius,
                ),
              ),
            ),
            Positioned(
              right: 12,
              top: 2,
              child: GestureDetector(
                child: widget.closeButton ??
                    Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.all(3),
                      child: Icon(
                        Icons.close_rounded,
                        size: 12,
                        color: widget.onCloseIconColor,
                      ),
                      decoration: BoxDecoration(
                        color: widget.onCloseBackGroundColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                onTap: widget.onClose ??
                    () {
                      isClosed.value = true;
                    },
              ),
            )
          ],
        );
      },
    );
  }

  void fadeIn() {
    _controller.forward();
  }

  void fadeOut() {
    _controller.reverse();
  }
}
