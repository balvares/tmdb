import '../entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.username,
    required super.password,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        "username": username,
        "password": password,
      };
}
