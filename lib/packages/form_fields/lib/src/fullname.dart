import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class Fullname extends FormzInput<String, FullnameValidationError>
    with EquatableMixin {
  const Fullname.unvalidated([
    String value = '',
  ]) : super.pure(value);
  const Fullname.validated(
    String value,
  ) : super.dirty(value);

  @override
  FullnameValidationError? validator(String value) {
    if (value.isEmpty) {
      return FullnameValidationError.empty;
    }

    if (value.length < 5 || value.length > 50) {
      return FullnameValidationError.invalid;
    }

    return null;
  }

  @override
  List<Object?> get props => [value, pure];
}

enum FullnameValidationError { empty, invalid }
