import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyfluter/Day-15/BlogPost/post_bloc.dart';
import 'package:studyfluter/Day-15/BlogPost/post_event.dart';
import 'package:studyfluter/Day-15/BlogPost/post_state.dart';


void main() {
  runApp(BlocProvider(
    create: (context) => PostBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PostListScreen(),
    );
  }
}

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('블로그 포스트 관리')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostListState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.content),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          _showPostForm(
                              context, index, post.title, post.content);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<PostBloc>().add(DeletePostEvent(index));
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(child: Text('포스트가 없습니다.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPostForm(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showPostForm(BuildContext context,
      [int? index, String? title, String? content]) {
    final titleController = TextEditingController(text: title);
    final contentController = TextEditingController(text: content);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(index == null ? '포스트 추가' : '포스트 수정'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: '제목'),
              ),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(labelText: '내용'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                if (index == null) {
                  // TODO: Implement the AddPostEvent method
                  context.read<PostBloc>().add(AddPostEvent(titleController.text, contentController.text));
                } else {
                  // TODO: Implement the UpdatePostEvent method
                  context.read<PostBloc>().add(UpdatePostEvent(index, titleController.text, contentController.text));
                }
                Navigator.pop(context);
              },
              child: const Text('저장'),
            ),
          ],
        );
      },
    );
  }
}
