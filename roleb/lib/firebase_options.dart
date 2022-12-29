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
    apiKey: 'AIzaSyAW3he-fUIaobOVtnMLHpHw8LoLKuQid1U',
    appId: '1:436284728447:web:f95f5cd3db0bb3552f8b4a',
    messagingSenderId: '436284728447',
    projectId: 'roleb-fb854',
    authDomain: 'roleb-fb854.firebaseapp.com',
    storageBucket: 'roleb-fb854.appspot.com',
    measurementId: 'G-BLGXH1HKE4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQwtq07lXszVPrSZaamtJBIQUzaXQucxk',
    appId: '1:436284728447:android:2bac3c3e16b1fa0a2f8b4a',
    messagingSenderId: '436284728447',
    projectId: 'roleb-fb854',
    storageBucket: 'roleb-fb854.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANAOw5UlBxK_K8ngKU78F3vJ42xq8CbgA',
    appId: '1:436284728447:ios:cfa03eacfec82b452f8b4a',
    messagingSenderId: '436284728447',
    projectId: 'roleb-fb854',
    storageBucket: 'roleb-fb854.appspot.com',
    iosClientId: '436284728447-33li5a6grork531rc36qpthqbe0hollp.apps.googleusercontent.com',
    iosBundleId: 'com.example.roleb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANAOw5UlBxK_K8ngKU78F3vJ42xq8CbgA',
    appId: '1:436284728447:ios:cfa03eacfec82b452f8b4a',
    messagingSenderId: '436284728447',
    projectId: 'roleb-fb854',
    storageBucket: 'roleb-fb854.appspot.com',
    iosClientId: '436284728447-33li5a6grork531rc36qpthqbe0hollp.apps.googleusercontent.com',
    iosBundleId: 'com.example.roleb',
  );
}