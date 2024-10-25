

// 블로그 포스트 이벤트의 기본 클래스
import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

// 포스트 추가 이벤트
class AddPostEvent extends PostEvent {
  final String title;
  final String content;

  const AddPostEvent(this.title, this.content);

  @override
  List<Object?> get props => [title, content];
}

// 포스트 수정 이벤트
class UpdatePostEvent extends PostEvent {
  final int index;
  final String title;
  final String content;

  const UpdatePostEvent(this.index, this.title, this.content);

  @override
  List<Object?> get props => [index, title, content];
}

// 포스트 삭제 이벤트
class DeletePostEvent extends PostEvent {
  final int index;

  const DeletePostEvent(this.index);

  @override
  List<Object?> get props => [index];
}
