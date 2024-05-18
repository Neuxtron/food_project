import 'package:flutter/material.dart';

class AppConstants {
  static const primary = Color(0xFF900E0E);
  static const secondary = Color(0xFF906B0E);
  static const background = Colors.white;

  static const baseUrl = "http://192.168.18.14:3000";
  static const rekening = "71717171";
  static String? token;
}

enum ServerStatus { normal, loading, error }
