import 'package:flutter_bloc/flutter_bloc.dart';
import 'athentication_event.dart';
import 'athentication_state.dart';


class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    // 로그인 이벤트 핸들러
    on<LoginEvent>((event, emit) async {
      emit(AuthenticationLoading());

      // 간단한 인증 로직
      await Future.delayed(const Duration(seconds: 2)); // 로딩 시뮬레이션

      if (event.email == 'test@test.com' && event.password == 'abc123') {
        emit(AuthenticationSuccess());
      } else {
        emit(const AuthenticationFailure(error: 'Invalid email or password'));
      }
    });

    // 로그아웃 이벤트 핸들러
    on<LogoutEvent>((event, emit) {
      emit(AuthenticationInitial());
    });
  }
}
