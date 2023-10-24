import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const SignInState()) {
    on<SignInEvent>((events, emit) async {
      await events.map(
        fetch: (event) async => await _onFetch(event, emit),
      );
    });
  }

  final AuthRepository _authRepository;

  _onFetch(SignInEvent event, Emitter<SignInState> emit) async {
    emit(state.copyWith(
      statePlaceholder: 'placeholder',
    ));
  }
}
