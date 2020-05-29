import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/blocs.dart';
import 'repositories/led_repository.dart';

import 'simple_bloc_delegate.dart';
import 'widgets/widgets.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final LEDRepository repository = LEDRepository();

  runApp(LEDApp(repository: repository,));
}

class LEDApp extends StatelessWidget {
  // This widget is the root of the application.

  final LEDRepository repository;

  LEDApp({Key key, @required this.repository}): assert(repository != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // scaffoldBackgroundColor: Colors.grey.withOpacity(0.5),
      ),
      home: BlocProvider(
        create: (context) =>
          LEDBloc(repository: repository),
            // ..add(GetLEDData()),
        child: LEDHome(title: 'Sample App'),
      ),
    );
  }
}

