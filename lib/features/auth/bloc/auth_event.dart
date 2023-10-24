part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.fetch({
    @Default('') String param,
  }) = _FetchAuthEvent;
}
