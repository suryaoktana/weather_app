import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const SignUpState()) {
    on<SignUpEvent>((events, emit) async {
      await events.map(
        fetch: (event) async => await _onFetch(event, emit),
      );
    });
  }

  final AuthRepository _authRepository;

  _onFetch(SignUpEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(
      statePlaceholder: 'placeholder',
    ));
  }
}
