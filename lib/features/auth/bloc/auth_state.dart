part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isAuthenticated,
    @Default(BaseResponse()) BaseResponse signInState,
    @Default(BaseResponse()) BaseResponse signUpState,
    @Default(BaseResponse()) BaseResponse signOutState,
  }) = _AuthState;
}
