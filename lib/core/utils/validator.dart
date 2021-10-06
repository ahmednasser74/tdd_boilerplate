import 'package:form_field_validator/form_field_validator.dart';

class CustomValidator {
  static final userNameValidation = MultiValidator([
        RequiredValidator(errorText: 'user name is required'),
        MinLengthValidator(4,
            errorText: 'user name must be at least 4 digits long'),

      ]),
      fullNameValidation = MultiValidator([
        RequiredValidator(errorText: 'full name is required'),
        MinLengthValidator(4,
            errorText: 'user name must be at least 4 digits long'),
      ]),
      passwordValidator = MultiValidator([
        RequiredValidator(errorText: 'password is required'),
        MinLengthValidator(8,
            errorText: 'password must be at least 8 digits long'),
        PatternValidator(r'(?=.*?[#?!@$%^&*-])',
            errorText: 'passwords must have at least one special character')
      ]);
}
