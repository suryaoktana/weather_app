part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.emailChanged({
    @Default('') String email,
  }) = _EmailChangedSignInEvent;

  const factory SignInEvent.passwordChanged({
    @Default('') String password,
  }) = _PasswordChangedSignInEvent;
}
