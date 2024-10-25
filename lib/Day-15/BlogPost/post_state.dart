
import 'package:equatable/equatable.dart';

class Post {
  final String title;
  final String content;

  Post({required this.title, required this.content});
}

// 블로그 포스트 상태의 기본 클래스
abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

// 초기 상태: 빈 목록
class PostInitial extends PostState {}

// 포스트 목록 상태
class PostListState extends PostState {
  final List<Post> posts;

  const PostListState(this.posts);

  @override
  List<Object?> get props => [posts];
}
