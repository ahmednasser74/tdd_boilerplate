import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String firstName, lastName, Gender, email;

  AuthEntity({
    required this.firstName,
    required this.lastName,
    required this.Gender,
    required this.email,
  });

  @override
  List<Object> get props => [firstName, lastName, Gender, email];
}
