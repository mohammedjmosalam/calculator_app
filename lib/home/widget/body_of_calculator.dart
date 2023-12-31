import 'dart:collection';

import 'package:flutter/material.dart';

import 'normal_row_elements.dart';

class BodyOfCalculator extends StatelessWidget {
  const BodyOfCalculator({super.key, required this.digateAndOperation});
  final Map<String, Function()> digateAndOperation;
  // * return new divided map
  Map<String, Function()> listToMap(List<String> digits) {
    Map<String, Function()> newMap = {};
    for (var element in digateAndOperation.keys
        .where((element) => digits.contains(element))) {
      newMap[element] = digateAndOperation[element]!;
    }
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NormalRowElement(numbers: listToMap(['AC', '/', '*'])),
        NormalRowElement(numbers: listToMap(['1', '2', '3', '*'])),
        NormalRowElement(numbers: listToMap(['4', '5', '6', '+'])),
        NormalRowElement(numbers: listToMap(['7', '8', '9', '-'])),
        NormalRowElement(numbers: listToMap(['0', '.', '='])),
      ],
    );
  }
}
