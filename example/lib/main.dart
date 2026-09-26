import 'dart:math';

import 'package:flutter/material.dart';
import 'package:signal_strength_indicator/signal_strength_indicator.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signal strength indicator example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _signalStrength = 0.0;
  double _minimumActiveValue = 0.1;

  void _changeValue(double value) {
    setState(() {
      _signalStrength = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signal strength indicator example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SignalStrengthIndicator.bars(value: _signalStrength, size: 20),
                SignalStrengthIndicator.bars(value: _signalStrength, size: 30),
                SignalStrengthIndicator.bars(value: _signalStrength, size: 40),
                SignalStrengthIndicator.bars(value: _signalStrength, size: 50),
                SignalStrengthIndicator.bars(value: _signalStrength, size: 70),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SignalStrengthIndicator.bars(
                  value: _signalStrength,
                  size: 50,
                  barCount: 4,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.blue[100],
                ),
                SignalStrengthIndicator.bars(
                  value: _signalStrength,
                  size: 50,
                  barCount: 4,
                  spacing: 0.5,
                ),
                SignalStrengthIndicator.bars(
                  value: _signalStrength,
                  size: 50,
                  barCount: 4,
                  radius: const Radius.circular(20.0),
                ),
                SignalStrengthIndicator.bars(
                  value: _signalStrength,
                  // ignore: prefer_const_literals_to_create_immutables
                  levels: <num, Color>{
                    0.25: Colors.red,
                    0.50: Colors.yellow,
                    0.75: Colors.green,
                  },
                  // radius: Radius.circular(20.0),
                  size: 50,
                ),
                SignalStrengthIndicator.bars(
                  value: _signalStrength,
                  size: 50,
                  barCount: 5,
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SignalStrengthIndicator.bars(
                  value: _signalStrength,
                  size: 50,
                  barCount: 4,
                  bevelled: true,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.blue[100],
                ),
                SignalStrengthIndicator.bars(
                  value: _signalStrength,
                  size: 50,
                  barCount: 4,
                  bevelled: true,
                  spacing: 0.5,
                ),
                SignalStrengthIndicator.bars(
                  value: _signalStrength,
                  size: 50,
                  bevelled: true,
                  spacing: -0.01,
                ),
                SignalStrengthIndicator.bars(
                  value: _signalStrength,
                  bevelled: true,
                  // ignore: prefer_const_literals_to_create_immutables
                  levels: <num, Color>{
                    0.25: Colors.red,
                    0.50: Colors.yellow,
                    0.75: Colors.green,
                  },
                  // radius: Radius.circular(20.0),
                  size: 50,
                ),
                SignalStrengthIndicator.bars(
                  value: _signalStrength,
                  size: 50,
                  barCount: 5,
                  bevelled: true,
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SignalStrengthIndicator.sector(
                  value: _signalStrength,
                  size: 50,
                  barCount: 4,
                  spacing: 0.5,
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: SignalStrengthIndicator.sector(
                    value: _signalStrength,
                    size: 50,
                    barCount: 4,
                    spacing: 0.5,
                    rounded: true,
                  ),
                ),
                Transform.rotate(
                  angle: -45 * pi / 180,
                  origin: const Offset(-15, 0),
                  child: SignalStrengthIndicator.sector(
                    value: _signalStrength,
                    size: 50,
                    spacing: -0.01,
                  ),
                ),
                SignalStrengthIndicator.sector(
                  value: _signalStrength,
                  size: 50,
                  spacing: 0.5,
                  // ignore: prefer_const_literals_to_create_immutables
                  levels: <num, Color>{
                    0.25: Colors.red,
                    0.50: Colors.yellow,
                    0.75: Colors.green,
                  },
                ),
                SignalStrengthIndicator.sector(
                  value: _signalStrength,
                  size: 50,
                  barCount: 4,
                  spacing: 0.5,
                  rounded: true,
                ),
              ],
            ),
            const SizedBox(height: 50),
            const Text('Minimum active value'),
            Text(_minimumActiveValue.toStringAsFixed(2)),
            Slider(
              value: _minimumActiveValue,
              min: 0,
              max: 0.3,
              divisions: 30,
              onChanged: (value) {
                setState(() {
                  _minimumActiveValue = value;
                });
              },
            ),
            Wrap(
              spacing: 24,
              runSpacing: 16,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Default'),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SignalStrengthIndicator.bars(
                          value: _signalStrength,
                          size: 50,
                        ),
                        const SizedBox(width: 12),
                        SignalStrengthIndicator.sector(
                          value: _signalStrength,
                          size: 50,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('With threshold'),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SignalStrengthIndicator.bars(
                          value: _signalStrength,
                          size: 50,
                          minimumActiveValue: _minimumActiveValue,
                        ),
                        const SizedBox(width: 12),
                        SignalStrengthIndicator.sector(
                          value: _signalStrength,
                          size: 50,
                          minimumActiveValue: _minimumActiveValue,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Signal strength: ${_signalStrength.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20.0),
            ),
            Slider(
              value: _signalStrength,
              onChanged: _changeValue,
            ),
          ],
        ),
      ),
    );
  }
}
