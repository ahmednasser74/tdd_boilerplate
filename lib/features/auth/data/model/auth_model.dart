import 'package:boilerplate/features/auth/domin/entities/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

// to generate file flutter pub run build_runner watch --delete-conflicting-outputs
part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel extends AuthEntity {
  AuthModel({
    required String firstName,
    required String lastName,
    required String Gender,
    required String email,
  }) : super(
          email: email,
          firstName: firstName,
          lastName: lastName,
          Gender: Gender,
        );

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
