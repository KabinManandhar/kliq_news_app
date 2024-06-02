import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kliq_news_app/app/favourite/data/model/local_article_model.dart';
import 'package:kliq_news_app/config/theme/provider/theme_provider.dart';
import 'package:kliq_news_app/firebase_options.dart';
import 'package:path_provider/path_provider.dart';

import 'config/router/app_router.dart';
import 'config/theme/dark_theme.dart';
import 'config/theme/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(LocalArticleModelAdapter());
  await Hive.openBox<LocalArticleModel>('localArticleModelBox');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: KliqNews()));
}

// final supabase = Supabase.instance.client;

class KliqNews extends StatelessWidget {
  KliqNews({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final themeMode = ref.watch(themeNotifierProvider);

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
          title: 'Kliq News',
          theme: lightTheme(context),
          themeMode: themeMode,
          builder: EasyLoading.init(),
          darkTheme: darkTheme(context),
        );
      },
    );
  }
}
