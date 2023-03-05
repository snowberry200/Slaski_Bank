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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCXo7WUWAOAPKbioB2TPo6soVPELddr61k',
    appId: '1:1078204483966:web:d94f25a1552e9a76bbcb2f',
    messagingSenderId: '1078204483966',
    projectId: 'wall-8e6be',
    authDomain: 'wall-8e6be.firebaseapp.com',
    storageBucket: 'wall-8e6be.appspot.com',
    measurementId: 'G-MVC2XZDZ6E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAD4v88v5RWYXyFmVPX_1z5Yv2x4inu_EY',
    appId: '1:1078204483966:android:b51e3df07793267cbbcb2f',
    messagingSenderId: '1078204483966',
    projectId: 'wall-8e6be',
    storageBucket: 'wall-8e6be.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQjgU2OhLSxNGB9ZN9mjTJtnZhhT00fiQ',
    appId: '1:1078204483966:ios:811e3e00b00891fcbbcb2f',
    messagingSenderId: '1078204483966',
    projectId: 'wall-8e6be',
    storageBucket: 'wall-8e6be.appspot.com',
    iosClientId: '1078204483966-jead69vvt9sl6gsci3rpmp31c92dcu8k.apps.googleusercontent.com',
    iosBundleId: 'com.enkasa.walmart',
  );
}