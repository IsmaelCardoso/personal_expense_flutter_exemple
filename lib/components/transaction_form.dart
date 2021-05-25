import 'package:flutter/material.dart';
import 'package:personal_expense_flutter_exemple/components/adaptativeButton.dart';
import 'package:personal_expense_flutter_exemple/components/adaptativeDatePicker.dart';
import 'package:personal_expense_flutter_exemple/components/adaptativeTextField.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isNotEmpty || value > 0 || _selectedDate != null) {
      widget.onSubmit(
        title,
        value,
        _selectedDate,
      );
    }

    return;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
            left: 10,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                controller: _titleController,
                label: "Title",
              ),
              AdaptativeTextField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                label: "Value (R\$)",
              ),
              AdaptativeDatePicker(
                  selectedDate: _selectedDate,
                  onDateChanged: (newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                    label: "New Transaction",
                    onPressed: _submitForm,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
