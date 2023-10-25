import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/models/base_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthBloc() : super(const AuthState()) {
    on<AuthEvent>(
      (events, emit) async {
        await events.map(
          signInSubmitted: (event) async =>
              await _onSignInSubmitted(event, emit),
          googleSignIn: (event) async => await _onGoogleSignIn(event, emit),
          signUpSubmitted: (event) async =>
              await _onSignUpSubmitted(event, emit),
          signOutSubmitted: (event) async =>
              await _onSignOutSubmitted(event, emit),
          listenFirebaseAuthStateChanges: (event) async =>
              await _onListenFirebaseAuthStateChanges(event, emit),
        );
      },
    );
  }

  _onSignInSubmitted(
      _SignInSubmittedAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signInState: BaseResponse.loading()));
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(state.copyWith(signInState: BaseResponse.complete()));
    } on FirebaseAuthException catch (_) {
      emit(state.copyWith(
          signInState: BaseResponse.error(
              message: 'Invalid Credentials or User is not registered yet')));
    }
  }

  _onGoogleSignIn(_GoogleSignInAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signInState: BaseResponse.loading()));
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser != null) {
        final GoogleSignInAuthentication gAuth = await gUser.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: gAuth.accessToken, idToken: gAuth.idToken);
        await _firebaseAuth.signInWithCredential(credential);
        emit(state.copyWith(signInState: BaseResponse.complete()));
      } else {
        ///sign in cancelled by user will return to default state
        emit(state.copyWith(signInState: const BaseResponse()));
      }
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          signInState: BaseResponse.error(message: e.message ?? '')));
    } catch (e) {
      emit(state.copyWith(signInState: BaseResponse.error()));
    }
  }

  _onSignUpSubmitted(
      _SignUpSubmittedAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signUpState: BaseResponse.loading()));
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(state.copyWith(signUpState: BaseResponse.complete()));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          signUpState: BaseResponse.error(message: e.message ?? '')));
    }
  }

  _onSignOutSubmitted(
      _SignOutSubmittedAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signOutState: BaseResponse.loading()));
    try {
      await GoogleSignIn().signOut();
      await _firebaseAuth.signOut();
      emit(state.copyWith(signOutState: BaseResponse.complete()));
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
      isAuthenticated = false;
    } else {
      isAuthenticated = true;
    }
    emit(
      state.copyWith(
        isAuthenticated: isAuthenticated,
      ),
    );
  }
}
