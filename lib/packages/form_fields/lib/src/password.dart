import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class Password extends FormzInput<String, PasswordValidationError>
    with EquatableMixin {
  const Password.unvalidated([
    String value = '',
  ]) : super.pure(value);
  const Password.validated(
    String value,
  ) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }
    if (value.length < 5 || value.length > 120) {
      return PasswordValidationError.invalid;
    }
    return null;
  }

  @override
  List<Object?> get props => [value, pure];
}

enum PasswordValidationError {
  empty,
  invalid,
}
