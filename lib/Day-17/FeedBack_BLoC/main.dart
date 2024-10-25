import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feedback_bloc.dart';
import 'feedback_model.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => FeedbackBloc(),
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

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback System')),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<FeedbackBloc, FeedbackState>(
              builder: (context, state) {
                if (state is FeedbackLoaded) {
                  return ListView.builder(
                    itemCount: state.feedbacks.length,
                    itemBuilder: (context, index) {
                      final feedback = state.feedbacks[index];
                      return ListTile(
                        title: Text(feedback.author),
                        subtitle: Text(feedback.content),
                        trailing:
                        Text(feedback.submittedAt.toLocal().toString()),
                      );
                    },
                  );
                }
                return const Center(child: Text('No feedbacks yet'));
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
            final feedback = FeedBack(
              author: authorController.text,
              content: contentController.text,
              submittedAt: DateTime.now(),
            );

            // TODO: Add the feedback
            context.read<FeedbackBloc>().add(AddFeedback(feedback));
            authorController.clear();
            contentController.clear();
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
