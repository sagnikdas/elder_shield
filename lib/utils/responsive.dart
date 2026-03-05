import 'package:flutter/material.dart';

/// Horizontal padding that scales with screen width (e.g. 4% of width, min 16).
double horizontalPadding(BuildContext context, {double fraction = 0.04, double min = 16, double max = 32}) {
  final w = MediaQuery.sizeOf(context).width;
  final value = w * fraction;
  return value.clamp(min, max);
}

/// Vertical padding for sections.
double verticalPadding(BuildContext context, {double min = 16, double max = 24}) {
  final h = MediaQuery.sizeOf(context).height;
  if (h < 600) return min;
  return (min + (h - 600) * 0.02).clamp(min, max);
}
