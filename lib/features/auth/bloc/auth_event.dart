part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInSubmitted(
      {required String email,
      required String password}) = _SignInSubmittedAuthEvent;

  const factory AuthEvent.signUpSubmitted(
      {required String email,
      required String password}) = _SignUpSubmittedAuthEvent;

  const factory AuthEvent.signOutSubmitted() = _SignOutSubmittedAuthEvent;

  const factory AuthEvent.listenFirebaseAuthStateChanges() =
      _ListenFirebaseAuthStateChangesAuthEvent;
}
