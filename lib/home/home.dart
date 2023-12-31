import 'package:calcuate_app/home/model/operation_and_digit.dart';
import 'package:flutter/material.dart';

import 'widget/body_of_calculator.dart';

enum OperationType {
  plus('+'),
  minus('-'),
  divided('/'),
  multiplication('*');

  final String value;
  const OperationType(this.value);
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final Map<String, Function()> digateAndOperation;
  late double firstNumber;
  late double result;
  String? operationType;
  late String numberEnter;
  late final List<OperationAndDigit> operationAndDigat;
  //! this commint to how we can send function via class
  // final Function() onTap;

  @override
  void initState() {
    firstNumber = 0;
    result = 0;
    numberEnter = '';
    //* OperationAndDigit(value: '0', onTap: () {});
    digateAndOperation = {
      '.': () {
        if (!numberEnter.contains('.')) {
          onTapDigate('.');
        }
      },
      'AC': () {
        setState(() {
          firstNumber = 0;
          result = 0;
          numberEnter = '';
          operationType = null;
        });
      },
      '0': () => onTapDigate('0'),
      '1': () => onTapDigate('1'),
      '2': () => onTapDigate('2'),
      '3': () => onTapDigate('3'),
      '4': () => onTapDigate('4'),
      '5': () => onTapDigate('5'),
      '6': () => onTapDigate('6'),
      '7': () => onTapDigate('7'),
      '8': () => onTapDigate('8'),
      '9': () => onTapDigate('9'),
      '+': () => onPressOperation(OperationType.plus),
      '-': () => onPressOperation(OperationType.minus),
      '*': () => onPressOperation(OperationType.multiplication),
      '/': () => onPressOperation(OperationType.divided),
      '=': () {
        if (operationType != null) {
          setState(() {
            result = resultOperation();
          });
        }
      }
    };
    super.initState();
  }

  void onPressOperation(OperationType newOprationType) {
    numberEnter = '';
    if (operationType != null) {
      firstNumber = resultOperation();
    }
    operationType = newOprationType.value;
  }

  double resultOperation() {
    switch (operationType) {
      case '+':
        return firstNumber + result;
      case '-':
        return firstNumber - result;
      case '/':
        return firstNumber / result;
      case '*':
        return firstNumber * result;
      default:
        return 0;
    }
  }

  void onTapDigate(String value) {
    setState(() {
      numberEnter += value;
      if (operationType != null) {
        result = double.parse(numberEnter);
      } else {
        firstNumber = double.parse(numberEnter);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    operationType == null ? numberEnter : result.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          BodyOfCalculator(digateAndOperation: digateAndOperation)
        ]),
      ),
    );
  }
}
