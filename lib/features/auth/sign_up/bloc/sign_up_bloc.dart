import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<SignUpEvent>((events, emit) async {
      await events.map(
        emailChanged: (event) async => await _onEmailChanged(event, emit),
        passwordChanged: (event) async => await _onPasswordChanged(event, emit),
      );
    });
  }

  _onEmailChanged(
      _EmailChangedSignUpEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(
      email: event.email,
    ));
  }

  _onPasswordChanged(
      _PasswordChangedSignUpEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(
      password: event.password,
    ));
  }
}
