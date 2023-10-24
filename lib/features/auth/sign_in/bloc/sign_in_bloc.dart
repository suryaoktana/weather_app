import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<SignInEvent>((events, emit) async {
      await events.map(
        emailChanged: (event) async => await _onEmailChanged(event, emit),
        passwordChanged: (event) async => await _onPasswordChanged(event, emit),
      );
    });
  }

  _onEmailChanged(
      _EmailChangedSignInEvent event, Emitter<SignInState> emit) async {
    emit(state.copyWith(
      email: event.email,
    ));
  }

  _onPasswordChanged(
      _PasswordChangedSignInEvent event, Emitter<SignInState> emit) async {
    emit(state.copyWith(
      password: event.password,
    ));
  }
}
