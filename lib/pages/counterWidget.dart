import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class CounterWidget extends StatefulWidget {
  final void Function(int) onCounterChanged;

  CounterWidget({Key? key, required this.onCounterChanged}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;
  FlutterTts flutterTts = FlutterTts();
  bool _isSoundEnabled = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
      widget.onCounterChanged(_counter);
      if (_isSoundEnabled) _speakCounter();
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        widget.onCounterChanged(_counter);
        if (_isSoundEnabled) _speakCounter();
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      widget.onCounterChanged(_counter);
      if (_isSoundEnabled) _speakCounter();
    });
  }

  Future<void> _speakCounter() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(1);
    await flutterTts.speak('$_counter');
    print("playing");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Japa Count',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:  Colors.deepPurple),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: _decrementCounter,
              iconSize: 48,
            ),
            SizedBox(width: 16),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color:  Colors.deepPurple),
            ),
            SizedBox(width: 16),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _incrementCounter,
              iconSize: 48,
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enable Sound'),
            Switch(
              value: _isSoundEnabled,
              onChanged: (value) {
                setState(() {
                  _isSoundEnabled = value;
                });
              },
            ),
          ],
        ),
        ElevatedButton(
          onPressed: _resetCounter,
          child: Icon(Icons.restart_alt),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            textStyle: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
