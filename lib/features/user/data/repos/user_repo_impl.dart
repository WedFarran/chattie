import 'package:chattie/core/error/exception.dart';
import 'package:chattie/core/error/failure.dart';
import 'package:chattie/core/network/network_info.dart';
import 'package:chattie/features/user/data/datasources/local_data_source.dart';
import 'package:chattie/features/user/data/datasources/remote_data_source.dart';
import 'package:chattie/features/user/data/models/user_model.dart';
import 'package:chattie/features/user/domain/entities/user_entitie.dart';
import 'package:chattie/features/user/domain/repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class UserRepoImpl implements UserRepo {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepoImpl(
      {required this.networkInfo,
      required this.remoteDataSource,
      required this.localDataSource});

  @override
  Future<Either<Failure, Unit>> addFriend(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.addFriend(id);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteFriend(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteFriend(id);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getAllFriends(List<String> ids) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFriends = await remoteDataSource.getAllFriends(ids);
        localDataSource.chacheFriends(remoteFriends);
        return Right(remoteFriends);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localFriend = await localDataSource.getChachedFriends();
        return Right(localFriend);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, User>> getUserProfile(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProfile = await remoteDataSource.getUserProfile(id);
        localDataSource.chacheUser(remoteProfile);
        return Right(remoteProfile);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localUser = await localDataSource.getChachedUser();
        return Right(localUser);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<User>>> searchForFriends(String username) async {
    if (await networkInfo.isConnected) {
      try {
        final users = await remoteDataSource.searchForFriends(username);
        return Right(users);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateProfile(User user) async {
    final UserModel userModel = UserModel(
        id: user.id,
        username: user.username,
        age: user.age,
        birthday: user.birthday,
        nationality: user.nationality,
        city: user.city,
        hobby: user.hobby,
        image: user.image,
        friends: user.friends);
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateProfile(userModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    }

    throw UnimplementedError();
  }
}
