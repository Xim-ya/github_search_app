import 'package:github_search_app/app/modules/index.dart';

class DomainException extends BaseException {
  final DomainExceptionType exceptionType;

  DomainException({required this.exceptionType, required super.message});

  factory DomainException.formFormatException(TypeError error) {
    const exception = DomainExceptionType.parsingFail;
    return DomainException(
      exceptionType: exception,
      message: exception.description,
    );
  }
}
