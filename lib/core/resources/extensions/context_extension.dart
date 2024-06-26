import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  dynamic get unfocus=>FocusScope.of(this).unfocus();
  bool get isDarkMode => (theme.brightness == Brightness.dark);
}
