import 'package:flutter/material.dart';
import 'package:meditation_app/mantra.dart';
import 'package:meditation_app/pages/counterWidget.dart';

class MantraDetailPage extends StatefulWidget {
  final Mantra mantra;

  MantraDetailPage({Key? key, required this.mantra}) : super(key: key);

  @override
  _MantraDetailPageState createState() => _MantraDetailPageState();
}

class _MantraDetailPageState extends State<MantraDetailPage> {
  int _counter = 0;

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mantra.title ?? '', style: TextStyle(fontSize: 24, fontFamily: 'SanskritFont', color: Colors.white,
        ),),
        backgroundColor: Colors
            .deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.mantra.sanskrit ?? '',
              style: TextStyle(fontSize: 24, fontFamily: 'SanskritFont', color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,

            ),
            SizedBox(height: 8.0),
            Text(
              widget.mantra.transliteration ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.mantra.translation ?? '',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CounterWidget(
              onCounterChanged: (counter) {
                setState(() {
                  _counter = counter;
                });
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}