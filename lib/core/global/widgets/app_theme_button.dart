import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq_news_app/config/theme/provider/theme_provider.dart';
import 'package:line_icons/line_icons.dart';

class ThemeToggleButton extends ConsumerStatefulWidget {
  const ThemeToggleButton({super.key});

  @override
  _ThemeToggleButtonState createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends ConsumerState<ThemeToggleButton> {
  int _currentIndex = 0;

  final List<IconData> _icons = [
    LineIcons.moon, // Dark theme icon
    LineIcons.globe, // System theme icon
    LineIcons.sun, // Light theme icon
  ];

  void _toggleTheme() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _icons.length;
    });

    final themeNotifier = ref.read(themeNotifierProvider.notifier);
    switch (_currentIndex) {
      case 0:
        themeNotifier.toogleDarkTheme();
        break;
      case 1:
        themeNotifier.toggleSystemTheme();
        break;
      case 2:
        themeNotifier.toggleLightTheme();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_icons[_currentIndex]),
      onPressed: _toggleTheme,
    );
  }
}
