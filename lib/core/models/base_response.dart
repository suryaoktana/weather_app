import 'package:equatable/equatable.dart';

enum ResponseState { success, error, empty, loading }

///this class created to encapsulate state data
///with <T> as type of object
class BaseResponse<T> extends Equatable {
  static const String errorMessage = 'Something went wrong! Please try again.';

  final ResponseState state;
  final T? data;
  final String message;

  const BaseResponse({
    this.state = ResponseState.empty,
    this.data,
    this.message = '',
  });

  static BaseResponse<T> empty<T>() {
    return const BaseResponse(state: ResponseState.empty);
  }

  static BaseResponse<T> loading<T>() {
    return const BaseResponse(state: ResponseState.loading);
  }

  static BaseResponse<T> complete<T>({T? data}) {
    return BaseResponse(
      state: ResponseState.success,
      data: data,
    );
  }

  static BaseResponse<T> error<T>(
      {String message = BaseResponse.errorMessage}) {
    return BaseResponse(state: ResponseState.error, message: message);
  }

  BaseResponse<T> copyWith({ResponseState? state, T? data, String? message}) {
    return BaseResponse<T>(
        state: state ?? this.state,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props {
    return [state, data, message];
  }
}
