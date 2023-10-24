part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.emailChanged({
    @Default('') String email,
  }) = _EmailChangedSignUpEvent;

  const factory SignUpEvent.passwordChanged({
    @Default('') String password,
  }) = _PasswordChangedSignUpEvent;
}
