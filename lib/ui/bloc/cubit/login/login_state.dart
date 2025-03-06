part of 'login_cubit.dart';

enum FormStatus { invalid, valid, validating }

class LoginFormState extends Equatable {
  const LoginFormState({
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
  });

  final Username username;
  final Password password;
  final bool isValid;
  final FormStatus formStatus;

  LoginFormState copyWith({
    FormStatus? formStatus,
    Username? username,
    Password? password,
    bool? isValid,
  }) => LoginFormState(
    formStatus: formStatus ?? this.formStatus,
    username: username ?? this.username,
    password: password ?? this.password,
    isValid: isValid ?? this.isValid,
  );

  @override
  List<Object> get props => [formStatus, username, password];
}
