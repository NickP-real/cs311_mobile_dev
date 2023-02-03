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
    apiKey: 'AIzaSyD9E0xY-V99z8F4JoljGAHBhQ8fRoh-eyo',
    appId: '1:12440773375:web:c4a11a177b32eafddc62ca',
    messagingSenderId: '12440773375',
    projectId: 'cs311w09-23502',
    authDomain: 'cs311w09-23502.firebaseapp.com',
    databaseURL: 'https://cs311w09-23502-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'cs311w09-23502.appspot.com',
    measurementId: 'G-DPNZ5FBG1K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBleRvhY3NF3Dt0t5VQB8KZ4sVewjIkmz8',
    appId: '1:12440773375:android:3038fd967b8a1238dc62ca',
    messagingSenderId: '12440773375',
    projectId: 'cs311w09-23502',
    databaseURL: 'https://cs311w09-23502-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'cs311w09-23502.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwe7GZr_pH66zprGpYQy0HtDv5UyZ3fLI',
    appId: '1:12440773375:ios:7529319c0eaa3ce3dc62ca',
    messagingSenderId: '12440773375',
    projectId: 'cs311w09-23502',
    databaseURL: 'https://cs311w09-23502-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'cs311w09-23502.appspot.com',
    iosClientId: '12440773375-d5h0lo218h44j4s7g7nlck0qnnvdaeb3.apps.googleusercontent.com',
    iosBundleId: 'com.example.addressForm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwe7GZr_pH66zprGpYQy0HtDv5UyZ3fLI',
    appId: '1:12440773375:ios:7529319c0eaa3ce3dc62ca',
    messagingSenderId: '12440773375',
    projectId: 'cs311w09-23502',
    databaseURL: 'https://cs311w09-23502-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'cs311w09-23502.appspot.com',
    iosClientId: '12440773375-d5h0lo218h44j4s7g7nlck0qnnvdaeb3.apps.googleusercontent.com',
    iosBundleId: 'com.example.addressForm',
  );
}
