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
    apiKey: 'AIzaSyCg3ivVHAWrgN1EQztKpszzE2roYMXkRz0',
    appId: '1:772201460717:web:c4057934cb9bac6b9d6de4',
    messagingSenderId: '772201460717',
    projectId: 'finstagram-cdd02',
    authDomain: 'finstagram-cdd02.firebaseapp.com',
    storageBucket: 'finstagram-cdd02.appspot.com',
    measurementId: 'G-N41412B1G6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHw03L80cp16VttG_K82nAjOiBs8UjQCM',
    appId: '1:772201460717:android:d2a3789699c3de2f9d6de4',
    messagingSenderId: '772201460717',
    projectId: 'finstagram-cdd02',
    storageBucket: 'finstagram-cdd02.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBV4klPKEL7zt-LAteAdrm-aazFDmuGzsY',
    appId: '1:772201460717:ios:639cbb9c9b94bc3c9d6de4',
    messagingSenderId: '772201460717',
    projectId: 'finstagram-cdd02',
    storageBucket: 'finstagram-cdd02.appspot.com',
    iosBundleId: 'com.example.finstagram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBV4klPKEL7zt-LAteAdrm-aazFDmuGzsY',
    appId: '1:772201460717:ios:639cbb9c9b94bc3c9d6de4',
    messagingSenderId: '772201460717',
    projectId: 'finstagram-cdd02',
    storageBucket: 'finstagram-cdd02.appspot.com',
    iosBundleId: 'com.example.finstagram',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCg3ivVHAWrgN1EQztKpszzE2roYMXkRz0',
    appId: '1:772201460717:web:4a8dcbe9d971032c9d6de4',
    messagingSenderId: '772201460717',
    projectId: 'finstagram-cdd02',
    authDomain: 'finstagram-cdd02.firebaseapp.com',
    storageBucket: 'finstagram-cdd02.appspot.com',
    measurementId: 'G-FD78BVF1SC',
  );
}
