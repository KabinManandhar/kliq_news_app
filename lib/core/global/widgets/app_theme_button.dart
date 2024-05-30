import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq_news_app/config/theme/provider/theme_provider.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';

class ThemeToggleButton extends ConsumerStatefulWidget {
  const ThemeToggleButton({super.key});

  @override
  _ThemeToggleButtonState createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends ConsumerState<ThemeToggleButton> {
  int _currentIndex = 0;

  final List<String> _emojis = [
    '🌙', // Dark theme emoji
    '🌍', // System theme emoji
    '☀️', // Light theme emoji
  ];

  void _toggleTheme() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _emojis.length;
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
      icon: Text(
        _emojis[_currentIndex],
        style: context.textTheme.bodyLarge, // Adjust font size as needed
      ),
      onPressed: _toggleTheme,
    );
  }
}
