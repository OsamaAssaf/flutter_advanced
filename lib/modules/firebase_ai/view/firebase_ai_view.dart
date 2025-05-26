import 'package:flutter_advanced/exports.dart';

class FirebaseAiView extends StatefulWidget {
  const FirebaseAiView({super.key});

  @override
  State<FirebaseAiView> createState() => _FirebaseAiViewState();
}

class _FirebaseAiViewState extends State<FirebaseAiView> {
  late TextEditingController promptController;

  @override
  void initState() {
    promptController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, FirebaseAiController provider, _) {
      return Scaffold(
        appBar: AppBar(title: const Text('Gemini Prompt')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: promptController,
                decoration: const InputDecoration(
                  labelText: 'Enter your prompt',
                  border: OutlineInputBorder(),
                ),
                minLines: 2,
                maxLines: 5,
                onTapOutside: (_) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: provider.isLoading
                    ? null
                    : () {
                        provider.sendPrompt(promptController.text.trim());
                      },
                child: provider.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Send'),
              ),
              const SizedBox(height: 24),
              if (provider.result != null)
                Expanded(
                  child: SingleChildScrollView(
                    child: MarkdownWidget(
                      data: provider.result!,
                      shrinkWrap: true,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
