import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/modules/field_format/components/card_number_formatter.dart';

class FieldFormatView extends StatelessWidget {
  const FieldFormatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Field Format'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CardNumberFormatter(
                    mask: 'xxxx-xxxx-xxxx-xxxx',
                    separator: '-',
                  ),
                ],
                decoration: const InputDecoration(
                  labelText: 'Numbers',
                ),
                onTapOutside: (_) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
