import 'package:firebase_test/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyD0VsR_I4Xus8WehDDm5dWI9TB5_PR9YxU',
      appId: '1:504917360449:android:e9c0b0068b074721592bc0',
      messagingSenderId: '504917360449',
      projectId: 'flutter-course-project-13ad1',
    ),
  );
  runApp(const MyApp());
}
