import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';
@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  void toogleDarkTheme() {
    state = ThemeMode.dark;
  }
  void toggleLightTheme() {
    state = ThemeMode.light;
  }
void toggleSystemTheme() {
    state = ThemeMode.system;
  }
  
}
