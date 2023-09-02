import 'package:chattie/features/user/domain/entities/user_entitie.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class UserRepo {
  Future<Either<Failure, List<User>>> getAllFriends(List<String> ids);
  Future<Either<Failure, User>> getUserProfile(String id);
  Future<Either<Failure, Unit>> deleteFriend(String id);
  Future<Either<Failure, Unit>> addFriend(String id);
  Future<Either<Failure, Unit>> updateProfile(User user);
  Future<Either<Failure, List<User>>> searchForFriends(String username);
}
