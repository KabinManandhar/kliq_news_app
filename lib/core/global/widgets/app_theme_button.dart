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

  final List<Map<String, String>> _themes = [
    {'emoji': '🌍', 'label': 'System'}, // System theme
    {'emoji': '🌙', 'label': 'Dark'}, // Dark theme
    {'emoji': '☀️', 'label': 'Light'}, // Light theme
  ];

  void _toggleTheme() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _themes.length;
    });

    final themeNotifier = ref.read(themeNotifierProvider.notifier);
    switch (_currentIndex) {
      case 0:
        themeNotifier.toggleSystemTheme();
        break;
      case 1:
        themeNotifier.toogleDarkTheme();
        break;
      case 2:
        themeNotifier.toggleLightTheme();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: IconButton(
          icon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _themes[_currentIndex]['emoji']!,
                style: context.textTheme.bodySmall,
              ),
              const SizedBox(width: 8.0),
              Text(
                _themes[_currentIndex]['label']!,
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
          onPressed: _toggleTheme,
        ),
      ),
    );
  }
}
