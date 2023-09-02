import 'package:chattie/features/user/domain/repos/user_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/user_entitie.dart';

class GetAllFriendsUseCAse {
  final UserRepo repo;
  GetAllFriendsUseCAse(this.repo);

  Future<Either<Failure, List<User>>> call(List<String> ids) async {
    return await repo.getAllFriends(ids);
  }
}
