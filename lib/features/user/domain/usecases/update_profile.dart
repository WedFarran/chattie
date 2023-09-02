import 'package:chattie/features/user/domain/repos/user_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/user_entitie.dart';

class UpdateProfileUseCAse {
  final UserRepo repo;
  UpdateProfileUseCAse(this.repo);

  Future<Either<Failure, Unit>> call(User user) async {
    return await repo.updateProfile(user);
  }
}
