import 'package:chattie/features/user/domain/entities/user_entitie.dart';
import 'package:chattie/features/user/domain/repos/user_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

class GetUserProfileUseCAse {
  final UserRepo repo;
  GetUserProfileUseCAse(this.repo);

  Future<Either<Failure, User>> call(String id) async {
    return await repo.getUserProfile(id);
  }
}
