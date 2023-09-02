import 'package:chattie/features/user/domain/repos/user_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

class AddFriendUseCAse {
  final UserRepo repo;
  AddFriendUseCAse(this.repo);

  Future<Either<Failure, Unit>> call(String id) async {
    return await repo.addFriend(id);
  }
}
