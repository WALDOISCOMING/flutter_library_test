import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BLoCHandlerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BLoCHandlerWidget();
  }
}
final counterBloc = CounterBloc();

class _BLoCHandlerWidget extends State<BLoCHandlerWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('BLOC TEST')),
      body: Column(children: <Widget>[
        TextButton(
          child: Text("Add" , style: TextStyle(fontSize: 30)),
          onPressed: counterBloc.increment
        ),
        StreamBuilder<int>(
            stream: counterBloc.counterObservable,
            initialData: 0,
            builder: (context, snapshot) {
                return Text("${snapshot.data}",
                    style: TextStyle(fontSize: 30));
            }
        ),
      ]),
    );
  }
  
}


class CounterBloc {
  int initialCount = 0;
  BehaviorSubject<int>? _subjectCounter; // rx

  CounterBloc() {
    _subjectCounter = BehaviorSubject<int>.seeded(initialCount);
  }

  Stream<int> get counterObservable => _subjectCounter!.stream;

  void increment() {
    _subjectCounter!.sink.add(++initialCount);
  }

  void decrement() {
    _subjectCounter!.sink.add(--initialCount);
  }

  void dispose() {
    _subjectCounter!.close();
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- bloc: ${bloc.runtimeType}');
  }
}
