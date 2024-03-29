///
/// 성공 실패 예외처리 타입을 정의하도록 도와주는 모듈
/// fold ->  [success] [failure] 타입을 리턴함.
/// getOrThor -> 둘 중 하나만 리턴.
///

abstract class Result<T> {
  static Result<T> failure<T>(Exception error) => Failure<T>(error);

  static Result<T> success<T>(T value) => Success<T>(value);

  T getOrThrow() {
    return this is Success
        ? (this as Success).value
        : throw (this as Failure).error;
  }

  R fold<R>({
    required R Function(T value) onSuccess,
    required R Function(Exception e) onFailure,
  }) {
    return this is Success
        ? onSuccess((this as Success).value)
        : onFailure((this as Failure).error);
  }
}

class Success<T> extends Result<T> {
  final T value;

  Success(this.value);
}

class Failure<T> extends Result<T> {
  final Exception error;

  Failure(this.error);
}
