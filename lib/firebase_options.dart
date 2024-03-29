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
    apiKey: 'AIzaSyAqFNAmZDqx1gVUBgjzfW__dPHqhRyTEYM',
    appId: '1:1026248551938:web:06efa079446cd6e83d811b',
    messagingSenderId: '1026248551938',
    projectId: 'crudflutter-a5076',
    authDomain: 'crudflutter-a5076.firebaseapp.com',
    storageBucket: 'crudflutter-a5076.appspot.com',
    measurementId: 'G-HF6P8PVJ6N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATfdRQ0waQurajOEfd2LDSo3XQEmIIYdY',
    appId: '1:1026248551938:android:1cfe0072ee8ae3983d811b',
    messagingSenderId: '1026248551938',
    projectId: 'crudflutter-a5076',
    storageBucket: 'crudflutter-a5076.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJn1OB5tDMeiTuDoC4QbxIzIivq8WavKE',
    appId: '1:1026248551938:ios:ab4fbeb9e88c21013d811b',
    messagingSenderId: '1026248551938',
    projectId: 'crudflutter-a5076',
    storageBucket: 'crudflutter-a5076.appspot.com',
    iosBundleId: 'com.example.crudflutter',
  );
}
