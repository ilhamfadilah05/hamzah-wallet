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
    apiKey: 'AIzaSyDxT05e5HeU0u15diWJBCCcZacF4BR3vfk',
    appId: '1:548063516434:web:736e01440917e56c3305cb',
    messagingSenderId: '548063516434',
    projectId: 'babu-app-78b8d',
    authDomain: 'babu-app-78b8d.firebaseapp.com',
    storageBucket: 'babu-app-78b8d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBp4Y0swnrT0Bl6wXoneru5uLOutTfSJZI',
    appId: '1:548063516434:android:c3e3af6a21f66ea53305cb',
    messagingSenderId: '548063516434',
    projectId: 'babu-app-78b8d',
    storageBucket: 'babu-app-78b8d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhHNm1KVibafDs_van9V3RTpLacneXrBg',
    appId: '1:548063516434:ios:7ac5b97c4e43c18d3305cb',
    messagingSenderId: '548063516434',
    projectId: 'babu-app-78b8d',
    storageBucket: 'babu-app-78b8d.appspot.com',
    iosBundleId: 'com.hamzah.wallet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDhHNm1KVibafDs_van9V3RTpLacneXrBg',
    appId: '1:548063516434:ios:0cea306cfe2d48733305cb',
    messagingSenderId: '548063516434',
    projectId: 'babu-app-78b8d',
    storageBucket: 'babu-app-78b8d.appspot.com',
    iosBundleId: 'com.hamzah.wallet.RunnerTests',
  );
}