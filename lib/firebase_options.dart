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
    apiKey: 'AIzaSyD9emJgLgdW9Ai-OzieUCNh0KB_CyJgHXw',
    appId: '1:149907476088:web:95a10b8be24305ae9ca78d',
    messagingSenderId: '149907476088',
    projectId: 'learnfirebase-5b791',
    authDomain: 'learnfirebase-5b791.firebaseapp.com',
    storageBucket: 'learnfirebase-5b791.appspot.com',
    measurementId: 'G-1MNW8W2HFV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCD4ADj8MkDbtPMiD6z5byj8LmjSkOa8ZQ',
    appId: '1:149907476088:android:8f1833c57f522d769ca78d',
    messagingSenderId: '149907476088',
    projectId: 'learnfirebase-5b791',
    storageBucket: 'learnfirebase-5b791.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDeZC97frojvSmRzZaCN55IA6YOQRb2G2E',
    appId: '1:149907476088:ios:98ecdf53a3e33c1d9ca78d',
    messagingSenderId: '149907476088',
    projectId: 'learnfirebase-5b791',
    storageBucket: 'learnfirebase-5b791.appspot.com',
    iosBundleId: 'com.example.newSoftlab',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDeZC97frojvSmRzZaCN55IA6YOQRb2G2E',
    appId: '1:149907476088:ios:98ecdf53a3e33c1d9ca78d',
    messagingSenderId: '149907476088',
    projectId: 'learnfirebase-5b791',
    storageBucket: 'learnfirebase-5b791.appspot.com',
    iosBundleId: 'com.example.newSoftlab',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD9emJgLgdW9Ai-OzieUCNh0KB_CyJgHXw',
    appId: '1:149907476088:web:be156f5bfa75cd9e9ca78d',
    messagingSenderId: '149907476088',
    projectId: 'learnfirebase-5b791',
    authDomain: 'learnfirebase-5b791.firebaseapp.com',
    storageBucket: 'learnfirebase-5b791.appspot.com',
    measurementId: 'G-XWRGPGGDLJ',
  );

}