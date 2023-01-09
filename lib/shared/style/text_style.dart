import 'package:flutter/material.dart';

class Style {
  static const s10 = _Size(10);
  static const s12 = _Size(12);
  static const s14 = _Size(14);
  static const s16 = _Size(16);
  static const s18 = _Size(18);
  static const s20 = _Size(20);
}

class _Size {
  final int size;
  const _Size(this.size);

  TextStyle? get w400 => TextStyle(
        fontSize: size.toDouble(),
        fontWeight: FontWeight.w400,
      );

  TextStyle? get w500 => TextStyle(
        fontSize: size.toDouble(),
        fontWeight: FontWeight.w500,
      );

  TextStyle? get w700 => TextStyle(
        fontSize: size.toDouble(),
        fontWeight: FontWeight.w700,
      );

  TextStyle? get bold => TextStyle(
        fontSize: size.toDouble(),
        fontWeight: FontWeight.bold,
      );
}
