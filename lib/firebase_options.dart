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
    apiKey: 'AIzaSyA99n1yCC-KagJAhJua3K8KoYDZ8LAqDdk',
    appId: '1:240673342161:web:0dd471bc0096b8b58f3bf0',
    messagingSenderId: '240673342161',
    projectId: 'movie-review-58630',
    authDomain: 'movie-review-58630.firebaseapp.com',
    storageBucket: 'movie-review-58630.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNZRPyZfmxOny4lsSyfjVo9-wR0axSmw0',
    appId: '1:240673342161:android:a6f4f8e1e74817d68f3bf0',
    messagingSenderId: '240673342161',
    projectId: 'movie-review-58630',
    storageBucket: 'movie-review-58630.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASWM8mVWJnn4lvRk3GFIJls1kZykdEX8c',
    appId: '1:240673342161:ios:dadd546a6472525d8f3bf0',
    messagingSenderId: '240673342161',
    projectId: 'movie-review-58630',
    storageBucket: 'movie-review-58630.appspot.com',
    iosBundleId: 'com.example.movieReview',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASWM8mVWJnn4lvRk3GFIJls1kZykdEX8c',
    appId: '1:240673342161:ios:a17083a49fd7d4b78f3bf0',
    messagingSenderId: '240673342161',
    projectId: 'movie-review-58630',
    storageBucket: 'movie-review-58630.appspot.com',
    iosBundleId: 'com.example.movieReview.RunnerTests',
  );
}
