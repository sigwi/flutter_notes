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
    apiKey: 'AIzaSyDUShcQcAlUZwwiPvLRWHI3nn-5BphFpdc',
    appId: '1:773923165184:web:7b91d12ee79af2f6a634e5',
    messagingSenderId: '773923165184',
    projectId: 'flutterchatapp-295f4',
    authDomain: 'flutterchatapp-295f4.firebaseapp.com',
    storageBucket: 'flutterchatapp-295f4.appspot.com',
    measurementId: 'G-PZXRCQ96P5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtMLpo5-4l2-LGqH6GvCGV8uRKWcIViE0',
    appId: '1:773923165184:android:f8611edffca166e1a634e5',
    messagingSenderId: '773923165184',
    projectId: 'flutterchatapp-295f4',
    storageBucket: 'flutterchatapp-295f4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByIS8-iTKIff-d9TpKmwT1qyMJ96BEIU0',
    appId: '1:773923165184:ios:6011aba1a38dfb22a634e5',
    messagingSenderId: '773923165184',
    projectId: 'flutterchatapp-295f4',
    storageBucket: 'flutterchatapp-295f4.appspot.com',
    iosClientId: '773923165184-7mdcbj3vm7jcat2g1uu7j3erj4c0q71m.apps.googleusercontent.com',
    iosBundleId: 'com.example.flashChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByIS8-iTKIff-d9TpKmwT1qyMJ96BEIU0',
    appId: '1:773923165184:ios:6011aba1a38dfb22a634e5',
    messagingSenderId: '773923165184',
    projectId: 'flutterchatapp-295f4',
    storageBucket: 'flutterchatapp-295f4.appspot.com',
    iosClientId: '773923165184-7mdcbj3vm7jcat2g1uu7j3erj4c0q71m.apps.googleusercontent.com',
    iosBundleId: 'com.example.flashChat',
  );
}