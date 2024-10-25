import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FeedbackProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FeedbackScreen(),
    );
  }
}

class Feedback {
  final String author;
  final String content;
  final DateTime submittedAt;

  Feedback({
    required this.author,
    required this.content,
    required this.submittedAt,
  });
}

class FeedbackProvider with ChangeNotifier {
  final List<Feedback> _feedbacks = [];

  List<Feedback> get feedbacks => _feedbacks;

  void addFeedback(Feedback feedback) {
    // TODO: Implement the addFeedback method
    _feedbacks.add(feedback);
    notifyListeners();
  }
}

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback System')),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FeedbackProvider>(
              builder: (context, provider, _) {
                return ListView.builder(
                  itemCount: provider.feedbacks.length,
                  itemBuilder: (context, index) {
                    final feedback = provider.feedbacks[index];
                    return ListTile(
                      title: Text(feedback.author),
                      subtitle: Text(feedback.content),
                      trailing: Text(feedback.submittedAt.toLocal().toString()),
                    );
                  },
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: FeedbackForm(),
          ),
        ],
      ),
    );
  }
}

class FeedbackForm extends StatelessWidget {
  const FeedbackForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authorController = TextEditingController();
    final contentController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: authorController,
          decoration: const InputDecoration(labelText: 'Author'),
        ),
        TextField(
          controller: contentController,
          decoration: const InputDecoration(labelText: 'Content'),
        ),
        ElevatedButton(
          onPressed: () {
            // Add the feedback
            final String author = authorController.text;
            final String content = contentController.text;

            if (author.isNotEmpty && content.isNotEmpty) {
              final feedback = Feedback(
                author: author,
                content: content,
                submittedAt: DateTime.now(),
              );

              Provider.of<FeedbackProvider>(context, listen: false).addFeedback(feedback);

              // Clear the text fields after submission
              authorController.clear();
              contentController.clear();
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
