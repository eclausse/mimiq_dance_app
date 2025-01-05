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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC-jaiMeM7gr6f2hnKrnqZG3MNM4Zg2HAQ',
    appId: '1:820333035104:web:2575e01e1f494bc4a00d05',
    messagingSenderId: '820333035104',
    projectId: 'mimiq-dance-demo',
    authDomain: 'mimiq-dance-demo.firebaseapp.com',
    storageBucket: 'mimiq-dance-demo.firebasestorage.app',
    measurementId: 'G-M9HYZYJN68',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC-jaiMeM7gr6f2hnKrnqZG3MNM4Zg2HAQ',
    appId: '1:820333035104:web:d696613cc6df14eea00d05',
    messagingSenderId: '820333035104',
    projectId: 'mimiq-dance-demo',
    authDomain: 'mimiq-dance-demo.firebaseapp.com',
    storageBucket: 'mimiq-dance-demo.firebasestorage.app',
    measurementId: 'G-WYDL1YST6Z',
  );
}
