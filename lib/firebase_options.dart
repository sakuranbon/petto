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
    apiKey: 'AIzaSyCtvlIwhype5WbQmLGdiiktIenxdqZs9UI',
    appId: '1:681092409525:web:2f613082cb348ee24f76fc',
    messagingSenderId: '681092409525',
    projectId: 'petto-528f8',
    authDomain: 'petto-528f8.firebaseapp.com',
    storageBucket: 'petto-528f8.appspot.com',
    measurementId: 'G-D3QMPY5QYW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmgX-DVrEN217atzrHbUIocKLrNCRWou4',
    appId: '1:681092409525:android:fe732ae3a0f0b35c4f76fc',
    messagingSenderId: '681092409525',
    projectId: 'petto-528f8',
    storageBucket: 'petto-528f8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVaPRTKXuXTxk2iLJNmfAnIj4Of71GaII',
    appId: '1:681092409525:ios:8314e8981d7973bd4f76fc',
    messagingSenderId: '681092409525',
    projectId: 'petto-528f8',
    storageBucket: 'petto-528f8.appspot.com',
    iosClientId: '681092409525-a61q4h14f687u7thba5k112c30eqjulr.apps.googleusercontent.com',
    iosBundleId: 'com.example.petto',
  );
}
