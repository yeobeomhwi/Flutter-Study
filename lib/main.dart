import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
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

class FeedbackController extends GetxController {
  var feedbacks = <Feedback>[].obs;

  void addFeedback(Feedback feedback) {
    // TODO: Implement the addFeedback method
    feedbacks.add(feedback);
  }
}

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FeedbackController feedbackController = Get.put(FeedbackController());

    return Scaffold(
      appBar: AppBar(title: const Text('Feedback System')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: feedbackController.feedbacks.length,
                itemBuilder: (context, index) {
                  final feedback = feedbackController.feedbacks[index];
                  return ListTile(
                    title: Text(feedback.author),
                    subtitle: Text(feedback.content),
                    trailing: Text(feedback.submittedAt.toLocal().toString()),
                  );
                },
              );
            }),
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
    final FeedbackController feedbackController = Get.find();
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
            feedbackController.addFeedback(feedback);
            authorController.clear();
            contentController.clear();
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
