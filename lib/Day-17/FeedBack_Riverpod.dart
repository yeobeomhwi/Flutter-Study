import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
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

class FeedbackNotifier extends StateNotifier<List<Feedback>> {
  FeedbackNotifier() : super([]);

  void addFeedback(Feedback feedback) {
    // TODO: Implement the addFeedback method
    state =[...state,feedback];
  }
}

final feedbackProvider =
StateNotifierProvider<FeedbackNotifier, List<Feedback>>(
      (ref) => FeedbackNotifier(),
);

class FeedbackScreen extends ConsumerWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Implement the watch method
     final feedbacks = ref.watch(feedbackProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Feedback System')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: feedbacks.length,
              itemBuilder: (context, index) {
                final feedback = feedbacks[index];
                return ListTile(
                  title: Text(feedback.author),
                  subtitle: Text(feedback.content),
                  trailing: Text(feedback.submittedAt.toLocal().toString()),
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

class FeedbackForm extends ConsumerWidget {
  const FeedbackForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            final feedback = Feedback(
              author: authorController.text,
              content: contentController.text,
              submittedAt: DateTime.now(),
            );
            // TODO: Add the feedback
            ref.read(feedbackProvider.notifier).addFeedback(feedback);
            authorController.clear();
            contentController.clear();
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
