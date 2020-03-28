import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_number_trivia/core/injector.dart';
import 'package:flutter_number_trivia/features/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter_number_trivia/features/presentation/widgets/trivia_control.dart';
import 'package:flutter_number_trivia/features/presentation/widgets/trivia_display.dart';

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
      body: SingleChildScrollView(
        child: _buildBody(),
      ),
    );
  }

  BlocProvider<NumberTriviaBloc> _buildBody() {
    return BlocProvider(
      create: (_) => locator<NumberTriviaBloc>(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TriviaDisplay(),
            TriviaControl(),
          ],
        ),
      ),
    );
  }
}
