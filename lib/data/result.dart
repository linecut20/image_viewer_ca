abstract class Result<T> {
  factory Result.success(T value) = Success<T>;
  factory Result.error(String e) = Error;
}

class Success<T> implements Result<T> {
  final T value;

  Success(this.value);
}

class Error<T> implements Result<T> {
  final String e;

  Error(this.e);
}
