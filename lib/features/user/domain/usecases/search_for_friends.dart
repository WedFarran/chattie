import 'package:chattie/features/user/domain/repos/user_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/user_entitie.dart';

class SearchForFriendsUseCAse {
  final UserRepo repo;
  SearchForFriendsUseCAse(this.repo);

  Future<Either<Failure, List<User>>> call(String username) async {
    return await repo.searchForFriends(username);
  }
}
