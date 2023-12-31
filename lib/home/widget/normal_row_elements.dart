import 'package:flutter/material.dart';

class NormalRowElement extends StatelessWidget {
  const NormalRowElement({super.key, required this.numbers});
  final Map<String, Function()> numbers;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: numbers
          .map(
            (key, e) => MapEntry(
              key,
              Expanded(
                flex: (numbers.length < 4 &&
                        numbers.values.toList().indexOf(e) == 0)
                    ? 2
                    : 1,
                child: InkWell(
                  onTap: e,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: numbers.values.toList().indexOf(e) ==
                              numbers.length - 1
                          ? Colors.amber
                          : Colors.grey[800],
                      border: Border.all(
                        color: Colors.white,
                        width: 0.5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        key,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
