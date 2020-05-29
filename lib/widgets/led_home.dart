import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class LEDHome extends StatefulWidget {
  LEDHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LEDHomeState createState() => _LEDHomeState();
}

class _LEDHomeState extends State<LEDHome> {

  Widget body(BuildContext context, LEDState state) {
    if (state is LEDEmpty || state is LEDLoading) {
      return Center(
        child: RaisedButton.icon(
          onPressed: () => BlocProvider.of<LEDBloc>(context).add(GetLEDData()),
          icon: Icon(Icons.star),
          label: Text('Get Data'),
        ),
      );
      // return Center(
      //   child: CircularProgressIndicator(),
      // );
    }

    if (state is LEDLoadFailed) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('There was an error getting LED data.\n${state.errorMsg}'),
            RaisedButton.icon(
              onPressed: () => BlocProvider.of<LEDBloc>(context).add(GetLEDData()),
              icon: Icon(Icons.refresh),
              label: Text("Retry")
            ),
          ],
        ),
      );
    }

    return Center(child: Text('Success'),);
  }

  Widget scrollContainer(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<LEDBloc, LEDState>(
        builder: (context, state) {
          return body(context, state);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: scrollContainer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

