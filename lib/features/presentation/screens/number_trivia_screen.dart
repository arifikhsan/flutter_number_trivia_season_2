import 'package:flutter/material.dart';

class NumberTriviaScreen extends StatefulWidget {
  @override
  _NumberTriviaScreenState createState() => _NumberTriviaScreenState();
}

class _NumberTriviaScreenState extends State<NumberTriviaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
