part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.fetch({
    @Default('') String param,
  }) = _FetchSignUpEvent;
}
