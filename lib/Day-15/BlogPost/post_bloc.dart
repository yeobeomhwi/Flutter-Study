
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyfluter/Day-15/BlogPost/post_event.dart';
import 'package:studyfluter/Day-15/BlogPost/post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<AddPostEvent>((event, emit) {
      if (state is PostListState) {
        final posts = List<Post>.from((state as PostListState).posts);
        posts.add(Post(title: event.title, content: event.content));
        emit(PostListState(posts));
      } else {
        emit(PostListState([Post(title: event.title, content: event.content)]));
      }
    });

    on<UpdatePostEvent>((event, emit) {
      if (state is PostListState) {
        final posts = List<Post>.from((state as PostListState).posts);
        posts[event.index] = Post(title: event.title, content: event.content);
        emit(PostListState(posts));
      }
    });

    on<DeletePostEvent>((event, emit) {
      if (state is PostListState) {
        final posts = List<Post>.from((state as PostListState).posts);
        posts.removeAt(event.index);
        emit(PostListState(posts));
      }
    });
  }
}
