// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

extension SizeExtension on num {
  // Returns a percentage of the screen height
  // Usage: 0.23.h
  double get h => ui.window.physicalSize.height / ui.window.devicePixelRatio * (this);

  // Returns a percentage of the screen width
  // Usage: 0.1.w
  double get w => ui.window.physicalSize.width / ui.window.devicePixelRatio * (this);

  // Professional Vertical Spacer
  // Usage: 0.02.vSpace
  Widget get vSpace => SizedBox(height: this.h);

  // Professional Horizontal Spacer
  // Usage: 0.02.hSpace
  Widget get hSpace => SizedBox(width: this.w);
}