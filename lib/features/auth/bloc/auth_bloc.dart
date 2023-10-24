import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState()) {
    on<AuthEvent>((events, emit) async {
      await events.map(
        fetch: (event) async => await _onFetch(event, emit),
      );
    });
  }

  final AuthRepository _authRepository;

  _onFetch(AuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      statePlaceholder: 'placeholder',
    ));
  }
}
