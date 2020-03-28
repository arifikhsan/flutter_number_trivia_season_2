import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_number_trivia/features/presentation/bloc/number_trivia_bloc.dart';

class TriviaControl extends StatefulWidget {
  const TriviaControl({
    Key key,
  }) : super(key: key);

  @override
  _TriviaControlState createState() => _TriviaControlState();
}

class _TriviaControlState extends State<TriviaControl> {
  void _dispatchRandom() {
    BlocProvider.of<NumberTriviaBloc>(context).add(GetTriviaForRandomNumber());
  }

  void _dispatchConcrete() {
    BlocProvider.of<NumberTriviaBloc>(context).add(GetTriviaForConcreteNumber('123'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            onPressed: _dispatchConcrete,
            color: Colors.blue,
            child: Text(
              'Get Concrete',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          RaisedButton(
            onPressed: _dispatchRandom,
            child: Text('Get Random'),
          ),
        ],
      ),
    );
  }
}
