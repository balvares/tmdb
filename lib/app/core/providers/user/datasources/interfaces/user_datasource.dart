import '../../domain/entities/user_entity.dart';

abstract interface class UserDatasource {
  Future<UserEntity> login();
}
