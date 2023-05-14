import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class Email extends FormzInput<String, EmailValidationError>
    with EquatableMixin {
  const Email.unvalidated([String value = '']) : super.pure(value);
  const Email.validated(String value) : super.dirty(value);

  static final _emailRegex = RegExp(
    '^(([\\w-]+\\.)+[\\w-]+|([a-zA-Z]|[\\w-]{2,}))@((([0-1]?'
    '[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.'
    '([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])'
    ')|([a-zA-Z]+[\\w-]+\\.)+[a-zA-Z]{2,4})\$',
  );

  @override
  EmailValidationError? validator(String value) {
    return value.isEmpty
        ? EmailValidationError.empty
        : (_emailRegex.hasMatch(value) ? null : EmailValidationError.invalid);
  }

  @override
  List<Object?> get props => [value, pure];
}

enum EmailValidationError {
  empty,
  invalid,
}
