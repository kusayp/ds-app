import 'dart:async';
import 'dart:ui';
import 'package:dsapp/bloc/bloc.dart';
import 'package:flutter/services.dart';
//import 'package:example/models/contact.dart';
import 'package:flutter/material.dart';

class MenuBloc extends Bloc {
  StreamSubscription _audioPlayerStateSubscription;

  Stream<String> get example => _exampleSubject.stream;
  Sink<String> get exampleSink => _exampleSubject.sink;
  final StreamController<String> _exampleSubject = StreamController<String>();

  MenuBloc();

  void dispose() {
    _exampleSubject.close();
  }
}
