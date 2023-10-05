import 'package:flutter/material.dart';

class ScreenConfig {
  final IconData icon;
  final String name;
  final Widget child;

  const ScreenConfig({
    required this.icon,
    required this.name,
    Widget? child
  }) : child = child ?? const Placeholder();
}