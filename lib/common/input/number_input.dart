import 'dart:ffi';

import 'package:formz/formz.dart';

// Define input validation errors
enum NumberError { empty, invalid }

// Extend FormzInput and provide the input type and error type.
class Number extends FormzInput<int, NumberError> {
  // Call super.pure to represent an unmodified form input.
  const Number.pure() : super.pure(0);

  // Call super.dirty to represent a modified form input.
  const Number.dirty(int value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == NumberError.empty) {
      return 'Debe seleccionar una hora, minuto o segundo';
    }
    if (displayError == NumberError.invalid) {
      return 'Debe seleccionar una hora, minuto o segundo válido';
    }
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  NumberError? validator(int value) {
    print(value);
    if (value < 0 || value > 24) return NumberError.invalid;
    return null;
  }
}
