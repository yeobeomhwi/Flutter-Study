import 'package:flutter_bloc/flutter_bloc.dart';
import 'feedback_model.dart';

// 피드백 이벤트 정의
abstract class FeedbackEvent {}

class AddFeedback extends FeedbackEvent {
  final FeedBack feedback;

  AddFeedback(this.feedback);
}

// 피드백 상태 정의
abstract class FeedbackState {}

class FeedbackInitial extends FeedbackState {}

class FeedbackLoaded extends FeedbackState {
  final List<FeedBack> feedbacks;

  FeedbackLoaded(this.feedbacks);
}

// 피드백 Bloc 정의
class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc() : super(FeedbackInitial()) {
    on<AddFeedback>(_onAddFeedback);
  }

  void _onAddFeedback(AddFeedback event, Emitter<FeedbackState> emit) {
    if (state is FeedbackLoaded) {
      // 현재 상태가 FeedbackLoaded일 경우, 새로운 피드백을 추가합니다.
      final updatedFeedbacks =
      List<FeedBack>.from((state as FeedbackLoaded).feedbacks)
        ..add(event.feedback);
      emit(FeedbackLoaded(updatedFeedbacks));
    } else {
      // 현재 상태가 FeedbackInitial일 경우, 피드백 리스트를 초기화합니다.
      emit(FeedbackLoaded([event.feedback]));
    }
  }
}
