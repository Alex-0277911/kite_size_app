import 'dart:math';

import 'package:flutter/material.dart';

class KiteCalcText extends StatelessWidget {
  const KiteCalcText({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kite and board calculator app',
      home: const SIForm(),
      theme: ThemeData(
        brightness: Brightness.dark,
        // primaryColor: Colors.indigo,
        // accent color
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(
          secondary: Colors.indigoAccent,
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}

class SIForm extends StatefulWidget {
  const SIForm({super.key});

  @override
  State<SIForm> createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  // создаем глобальный ключ формы
  final _formKey = GlobalKey<FormState>();
  final _typeWindSpeed = ['m/s', 'kts', 'kmph', 'mph'];
  final _minimumPadding = 5.0;

  // в пересенной храним выбранное значение из списка валют
  var _currentItemSelected = '';

  // метод вызывается при инициализации приложения
  @override
  void initState() {
    // при начальной инициализации присваиваем первый элемент из листа списка
    _currentItemSelected = _typeWindSpeed[0];
    super.initState();
  }

//
// создаем контроллеры для отслеживания редактирования текста в текстовых полях
  TextEditingController weightController = TextEditingController();
  TextEditingController weightLbsController = TextEditingController();
  TextEditingController windSpeedController = TextEditingController();

  // переменная в которой храним временный текст для вывода на экран
  var displayResult = '';
  int windSpeedMs = 1;

  @override
  Widget build(BuildContext context) {
    // определяем текстовый стиль, который будет унаследован с контекста родительского виджета
    // в нашем случае будет унаследован контекст приложения
    TextStyle? textStyle = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent.shade700,
        //toolbarTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        title: Text(
          'Kite and board calculator',
          style: textStyle,
        ),
      ),
      body: Form(
        // ключ формы созданый ранее (используется для идентификации формы)
        // используя этот ключ мы можем получить статуыс формы
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding * 2),
          child: ListView(
            // меняем Column на ListView для прокрутки страницы на маленьких экранах
            // или когда много виджетов
            children: <Widget>[
              // Image
              getImageAsset(),
              // текстовое поле вес кайтера в кг
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: weightController,
                  // используем валидатор для проверки данных которые ввоводятсся в форму
                  validator: (value) {
                    // выводим предупреждение если форма ввода пустая
                    if (value!.isEmpty) {
                      return 'Будь ласка введіть значення ваги';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.white60), //<-- SEE HERE
                    ),
                    labelText: 'Kiter Weight in kg',
                    hintText: 'Введіть ціле цифрове значення ваги',
                    labelStyle: textStyle,
                    errorStyle: const TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 15.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              // текстовое поле вес кайтера в lbs (Funt )
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: weightLbsController,
                  // используем валидатор для проверки данных которые ввоводятсся в форму
                  validator: (value) {
                    // выводим предупреждение если форма ввода пустая
                    if (value!.isEmpty) {
                      return 'Будь ласка введіть значення ваги';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.white60), //<-- SEE HERE
                    ),
                    labelText: 'Kiter Weight in lbs (funt)',
                    hintText: 'Введіть ціле цифрове значення ваги',
                    labelStyle: textStyle,
                    errorStyle: const TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 15.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: [
                    // текстовое поле сокрость ветра
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: windSpeedController,
                        // используем валидатор для проверки данных которые ввоводятсся в форму
                        validator: (value) {
                          // выводим предупреждение если форма ввода пустая
                          if (value!.isEmpty) {
                            return 'Будь ласка введіть значення швидкості вітру';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: Colors.white60), //<-- SEE HERE
                          ),
                          labelText: 'Wind Speed in',
                          hintText: 'Введіть швидкість вітру',
                          labelStyle: textStyle,
                          errorStyle: const TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    //
                    SizedBox(width: _minimumPadding * 5),
                    Expanded(
                      child: DropdownButton(
                          items: _typeWindSpeed.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: _currentItemSelected,
                          onChanged: (newValueSelected) {
                            //code here
                            _onDropDownItemSelected(newValueSelected);
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.all(_minimumPadding),
                      child: Text('in m/s $windSpeedMs', style: textStyle),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: [
                    //
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          setState(() {
                            // выполняем проверку на правильность содержимого поля
                            // для проверки используем ключ формы (он уникален для
                            // формы и позволяет однозначно идентифицироватть форму)
                            // _formKey.currentState.validate() метод возвращает TRUE
                            // если форма прошла валидацию, т.е. все данные в
                            // допустимом формате и диапазоне
                            if (_formKey.currentState!.validate()) {
                              displayResult = _calculateKite();
                            }
                          });
                        },
                        child: Text(
                          'Calc kite',
                          style: textStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: _minimumPadding * 5),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          //
                          setState(() {
                            displayResult = _calculateBoard();
                          });
                        },
                        child: Text(
                          'Calc board',
                          style: textStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Text(displayResult, style: textStyle),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: [
                    //
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          //
                        },
                        child: Text(
                          'Reserved',
                          style: textStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: _minimumPadding * 5),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          //
                          setState(() {
                            _reset();
                          });
                        },
                        child: Text(
                          'Reset',
                          style: textStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // определяем виджет для отображения изображения
  Widget getImageAsset() {
    // переменная asset
    AssetImage assetImage = const AssetImage('assets/images/eleveight.png');
    // переменная image
    Image image = Image(
      image: assetImage,
      width: 250.0,
      height: 250.0,
    );
    return Container(
      margin: EdgeInsets.all(_minimumPadding * 10.0),
      child: image,
    );
  }

// функция вызывается при выборе из списка валюты (в качестве
// параметра newValueSelected) передается выбранная в данный момент валюта
  void _onDropDownItemSelected(newValueSelected) {
    //
    setState(() {
      if (newValueSelected == _typeWindSpeed[0]) {
        // select m/s
        windSpeedMs = double.parse(windSpeedController.text).round();
      } else if (newValueSelected == _typeWindSpeed[1]) {
        // select kts
        windSpeedMs = (double.parse(windSpeedController.text) / 1.944).round();
      } else if (newValueSelected == _typeWindSpeed[2]) {
        // select kmph
        windSpeedMs = (double.parse(windSpeedController.text) / 3.6).round();
      } else if (newValueSelected == _typeWindSpeed[3]) {
        // select mph
        windSpeedMs = (double.parse(windSpeedController.text) * 0.447).round();
      }
      _currentItemSelected = newValueSelected;
    });
  }

  String _calculateKite() {
    // извлекаем значение полей с помощью контроллера
    double weight = double.parse(weightController.text);
    // double weightLbs = double.parse(weightLbsController.text);
    // double windSpeed = double.parse(windSpeedController.text);
    // подсчитываем нужные формулы
    int kiteSize = ((1.124 * weight) / windSpeedMs).round();
    String result =
        'For a weight of $weight kg and a wind speed of $windSpeedMs m/s, the approximate kite size required is $kiteSize square meters.';
    return result;
  }

  String _calculateBoard() {
    // извлекаем значение полей с помощью контроллера
    double weight = double.parse(weightController.text);
    // double weightLbs = double.parse(weightLbsController.text);
    // double windSpeed = double.parse(windSpeedController.text);
    // подсчитываем нужные формулы
    // final answer = pow(8, 2); // 64
    int boardLenght = (33.53 * pow((weight), 1 / 3)).round();
    int boardWidth = (9.9 * pow((weight), 1 / 3)).round();
    int boardArea = (boardLenght * boardWidth * 0.9).round();
    String result =
        'For a weight of $weight kg, the approximate board size required is $boardLenght x $boardWidth santimeters. The area of the board is $boardArea square centimeters.';
    return result;
  }

  void _reset() {
    weightController.text = '';
    weightLbsController.text = '';
    windSpeedController.text = '';
    displayResult = '';
  }
}
