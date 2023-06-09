// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA5AxLc4ZJHtkAF57JRTMa8JPLg0hHvghU',
    appId: '1:743700341078:web:32b924f1283fa88c2576f7',
    messagingSenderId: '743700341078',
    projectId: 'my-app-b2121',
    authDomain: 'my-app-b2121.firebaseapp.com',
    storageBucket: 'my-app-b2121.appspot.com',
    measurementId: 'G-8YTN2LMQXY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOWlj_XcZugbjG6QJ7xGKiqn9bdr5Ko1w',
    appId: '1:743700341078:android:e9477aa4dd4ea4a22576f7',
    messagingSenderId: '743700341078',
    projectId: 'my-app-b2121',
    storageBucket: 'my-app-b2121.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqdmr6NfSqQnu-m2AVlktUcCqL6hipEx8',
    appId: '1:743700341078:ios:eee7e081a9d4666a2576f7',
    messagingSenderId: '743700341078',
    projectId: 'my-app-b2121',
    storageBucket: 'my-app-b2121.appspot.com',
    iosClientId: '743700341078-l5ssl402ls8llros8bb43tju40legg5o.apps.googleusercontent.com',
    iosBundleId: 'com.example.myapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqdmr6NfSqQnu-m2AVlktUcCqL6hipEx8',
    appId: '1:743700341078:ios:eee7e081a9d4666a2576f7',
    messagingSenderId: '743700341078',
    projectId: 'my-app-b2121',
    storageBucket: 'my-app-b2121.appspot.com',
    iosClientId: '743700341078-l5ssl402ls8llros8bb43tju40legg5o.apps.googleusercontent.com',
    iosBundleId: 'com.example.myapp',
  );
}
