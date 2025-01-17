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
    apiKey: 'AIzaSyARvtkDfVZS-YZM4tSwEl6zFOfcqp2xgVA',
    appId: '1:519618841057:web:fb93fe1b9170821bfeeaa0',
    messagingSenderId: '519618841057',
    projectId: 'firebase-login-surah',
    authDomain: 'fir-login-surah.firebaseapp.com',
    storageBucket: 'firebase-login-surah.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0nTO0kRy7StSq7NcX0Fx7TPQzwC8OwxU',
    appId: '1:519618841057:android:20d5c366a807628ffeeaa0',
    messagingSenderId: '519618841057',
    projectId: 'firebase-login-surah',
    storageBucket: 'firebase-login-surah.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxS3_bkMUqdBvkmbj2JXPWYddtm_q_fcQ',
    appId: '1:519618841057:ios:3867059de65c5a08feeaa0',
    messagingSenderId: '519618841057',
    projectId: 'firebase-login-surah',
    storageBucket: 'firebase-login-surah.firebasestorage.app',
    iosBundleId: 'com.example.flutterAplikasiSurahTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBxS3_bkMUqdBvkmbj2JXPWYddtm_q_fcQ',
    appId: '1:519618841057:ios:3867059de65c5a08feeaa0',
    messagingSenderId: '519618841057',
    projectId: 'firebase-login-surah',
    storageBucket: 'firebase-login-surah.firebasestorage.app',
    iosBundleId: 'com.example.flutterAplikasiSurahTest',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyARvtkDfVZS-YZM4tSwEl6zFOfcqp2xgVA',
    appId: '1:519618841057:web:5bf83f738c552554feeaa0',
    messagingSenderId: '519618841057',
    projectId: 'firebase-login-surah',
    authDomain: 'fir-login-surah.firebaseapp.com',
    storageBucket: 'firebase-login-surah.firebasestorage.app',
  );
}
