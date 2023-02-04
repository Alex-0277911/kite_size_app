import 'package:flutter/material.dart';

class KiteCalcGraf extends StatelessWidget {
  const KiteCalcGraf({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kite and board calculator app',
      home: KiteCalc(), // kite and board kalculator
    );
  }
}

class KiteCalc extends StatefulWidget {
  const KiteCalc({super.key});

  @override
  State<KiteCalc> createState() => _KiteCalcState();
}

class _KiteCalcState extends State<KiteCalc> {
  //var _currencies = ['EURO', 'USD', 'PLN', 'Other'];
  final _weightUnit = 'kg'; //(1 kg = 2.2 lbs) // 1 - kg, 0 - lbs
  final _windUnit = ['m/s', 'kts', 'mph', 'kmph'];
  var _kiterWeight = 85;
  double _currentSliderValue = 85.0;

  bool _windUnitMs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[400],
        elevation: 5.0,
        leading: IconButton(
          icon: const Icon(Icons.question_mark),
          tooltip: 'FAQs and answers',
          onPressed: () {},
        ),
        title: const Text('Kite & board calculator'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info),
            tooltip: 'App information',
            onPressed: () {},
          ), //IconButton
        ], //<Widget>[]
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Unit set:',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                _windUnit[0],
                style: const TextStyle(
                  fontSize: 28,
                ),
              ),
              // перемикач вибору одиниць швидкості вітру (мс чи вузли)
              Switch(
                value: _windUnitMs,
                onChanged: (bool value) {
                  setState(() {
                    _windUnitMs = value;
                    if (_windUnitMs == true) {
                      //
                    } else {
                      //
                    }
                  });
                },
              ),
              //
            ],
          ),
          const SizedBox(
            width: 10,
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Kiter weight: ${_kiterWeight.toString()} $_weightUnit',
                style: const TextStyle(
                  fontSize: 34,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /// button remove weight 5 unit
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.remove_circle),
                  tooltip: 'Decrease weight by 5',
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      if (_currentSliderValue <= 30) {
                        _currentSliderValue = 30;
                      } else {
                        _currentSliderValue -= 5;
                      }
                      _kiterWeight = _currentSliderValue.round();
                    });
                  },
                ),
              ),

              ///
              Slider(
                value: _currentSliderValue,
                min: 30,
                max: 130,
                divisions: 20,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                    _kiterWeight = _currentSliderValue.round();
                  });
                },
              ),

              /// button add weight 5 unit
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add_circle),
                  tooltip: 'Increase weight by 5',
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      if (_currentSliderValue >= 130) {
                        _currentSliderValue = 130;
                      } else {
                        _currentSliderValue += 5;
                      }
                      _kiterWeight = _currentSliderValue.round();
                    });
                  },
                ),
              ),

              ///
            ],
          ),
        ],
      ), //AppBar
    );
  }
}
