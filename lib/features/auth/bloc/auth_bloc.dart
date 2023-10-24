import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/models/base_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthEvent>((events, emit) async {
      await events.map(
        signInSubmitted: (event) async => await _onSignInSubmitted(event, emit),
        signUpSubmitted: (event) async => await _onSignUpSubmitted(event, emit),
        signOutSubmitted: (event) async =>
            await _onSignOutSubmitted(event, emit),
        listenFirebaseAuthStateChanges: (event) async =>
            await _onListenFirebaseAuthStateChanges(event, emit),
      );
    });
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  _onSignInSubmitted(
      _SignInSubmittedAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signInState: BaseResponse.loading()));
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(state.copyWith(
          signInState: BaseResponse.complete(), isAuthenticated: true));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          signInState: BaseResponse.error(message: e.message ?? '')));
    }
  }

  _onSignUpSubmitted(
      _SignUpSubmittedAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signUpState: BaseResponse.loading()));
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(state.copyWith(
          signUpState: BaseResponse.complete(), isAuthenticated: true));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          signUpState: BaseResponse.error(message: e.message ?? '')));
    }
  }

  _onSignOutSubmitted(
      _SignOutSubmittedAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signOutState: BaseResponse.loading()));
    try {
      await _firebaseAuth.signOut();
      emit(state.copyWith(
          signOutState: BaseResponse.complete(), isAuthenticated: false));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          signOutState: BaseResponse.error(message: e.message ?? '')));
    }
  }

  _onListenFirebaseAuthStateChanges(
      _ListenFirebaseAuthStateChangesAuthEvent event,
      Emitter<AuthState> emit) async {
    bool isAuthenticated = false;
    if (_firebaseAuth.currentUser == null) {
      debugPrint('unauthenticated');
      isAuthenticated = false;
    } else {
      debugPrint('authenticated');
      isAuthenticated = true;
    }
    emit(state.copyWith(
      isAuthenticated: isAuthenticated,
    ));
  }
}
