import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime)? onDateChanged;

  const AdaptativeDatePicker({
    this.selectedDate,
    this.onDateChanged,
    Key? key,
  }) : super(key: key);

  _showDatePicker(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime thirtyDaysFromNow = now.add(const Duration(days: 30));

    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: thirtyDaysFromNow,
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged!(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime.now(),
              maximumDate: DateTime.now().add(const Duration(days: 30)),
              onDateTimeChanged: onDateChanged!,
            ),
          )
        : SizedBox(
            height: 70,
            child: Row(
              children: <Widget>[
                Text(
                  selectedDate == null
                      ? 'Nenhuma data selecionada!'
                      : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate!)}',
                ),
                TextButton(
                  child: const Text(
                    'Selecionar Data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => _showDatePicker(context),
                )
              ],
            ),
          );
  }
}
