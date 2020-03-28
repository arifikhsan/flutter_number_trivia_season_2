import 'package:flutter/material.dart';
import 'package:flutter_number_trivia/core/injector.dart';
import 'package:flutter_number_trivia/features/presentation/screens/number_trivia_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: NumberTriviaScreen(),
    );
  }
}
