import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
                  MaskTextInputFormatter(
                    mask: '####-####-####-####',
                    filter: {
                      '#': RegExp(r'[0-9]'),
                    },
                  ),
                ],
                decoration: const InputDecoration(
                  labelText: 'Numbers',
                  enabledBorder: OutlineInputBorder(),
                ),
                onTapOutside: (_) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: '+### ## #### ###',
                    filter: {
                      '#': RegExp(r'[0-9]'),
                    },
                  ),
                ],
                decoration: const InputDecoration(
                  labelText: 'Mobile',
                  enabledBorder: OutlineInputBorder(),
                ),
                onTapOutside: (_) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: '##/##/####',
                    filter: {
                      '#': RegExp(r'[0-9]'),
                    },
                    type: MaskAutoCompletionType.eager,
                  ),
                ],
                decoration: const InputDecoration(
                  labelText: 'Date',
                  enabledBorder: OutlineInputBorder(),
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
