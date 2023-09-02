import 'package:chattie/features/user/domain/repos/user_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

class DeleteFriendUseCAse {
  final UserRepo repo;
  DeleteFriendUseCAse(this.repo);

  Future<Either<Failure, Unit>> call(String id) async {
    return await repo.deleteFriend(id);
  }
}
