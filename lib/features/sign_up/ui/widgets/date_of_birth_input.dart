import 'package:blink2/core/helpers/spacing.dart';
import 'package:blink2/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateOfBirthInput extends StatefulWidget {
  final String labelText;
  // final DateTime initialDate;
  final Function(DateTime) onDateSelected;

  const DateOfBirthInput({
    super.key,
    required this.labelText,
    // this.initialDate = DateTime(1990, 1, 1),
    required this.onDateSelected,
  });

  @override
  State<DateOfBirthInput> createState() => _DateOfBirthInputState();
}

class _DateOfBirthInputState extends State<DateOfBirthInput> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        widget.onDateSelected(selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = selectedDate != null
        ? DateFormat('yMMMMd').format(selectedDate!)
        : 'Date of Birth';
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            fontFamily: 'LTSaeada',
            color: Colors.grey[600]!,
          ),
        ),
        horizontalSpace(10),
        ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              AppColors.kOrangeAccentColor,
            ),
          ),
          onPressed: () => _selectDate(context),
          child: Text(
            formattedDate,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
