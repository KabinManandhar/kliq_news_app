// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDuulHS6_8cXcf0v4b_aCpaZtTZXQhR0yQ',
    appId: '1:438283501369:web:246f9e0303f860ce63f2e8',
    messagingSenderId: '438283501369',
    projectId: 'kliq-news-app',
    authDomain: 'kliq-news-app.firebaseapp.com',
    storageBucket: 'kliq-news-app.appspot.com',
    measurementId: 'G-GQMCDHQ8QX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApEcEForOk0naH2h1hoyLQwBBpJbKBYa8',
    appId: '1:438283501369:android:7cec77f9c1ffe3a263f2e8',
    messagingSenderId: '438283501369',
    projectId: 'kliq-news-app',
    storageBucket: 'kliq-news-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByAlWqNGpV3r55o--EvMvv2mxSQJXglD4',
    appId: '1:438283501369:ios:bff8c88b47a3a1dd63f2e8',
    messagingSenderId: '438283501369',
    projectId: 'kliq-news-app',
    storageBucket: 'kliq-news-app.appspot.com',
    iosBundleId: 'com.example.kliqNewsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByAlWqNGpV3r55o--EvMvv2mxSQJXglD4',
    appId: '1:438283501369:ios:bff8c88b47a3a1dd63f2e8',
    messagingSenderId: '438283501369',
    projectId: 'kliq-news-app',
    storageBucket: 'kliq-news-app.appspot.com',
    iosBundleId: 'com.example.kliqNewsApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDuulHS6_8cXcf0v4b_aCpaZtTZXQhR0yQ',
    appId: '1:438283501369:web:dc06694fd255486d63f2e8',
    messagingSenderId: '438283501369',
    projectId: 'kliq-news-app',
    authDomain: 'kliq-news-app.firebaseapp.com',
    storageBucket: 'kliq-news-app.appspot.com',
    measurementId: 'G-11MLQ8TLED',
  );
}
