import 'dart:convert';

import 'package:chattie/core/error/exception.dart';
import 'package:chattie/features/user/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<List<UserModel>> getChachedFriends();
  Future<Unit> chacheFriends(List<UserModel> friends);
  Future<UserModel> getChachedUser();
  Future<Unit> chacheUser(UserModel user);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl(this.sharedPreferences);
  @override
  Future<Unit> chacheFriends(List<UserModel> friends) {
    List userModerToJson = friends
        .map<Map<String, dynamic>>((userModel) => userModel.toJson())
        .toList();
    sharedPreferences.setString('CACHED_USERS', jsonEncode(userModerToJson));
    return Future.value(unit);
  }

  @override
  Future<Unit> chacheUser(UserModel user) {
    UserModel userModerToJson = user;
    sharedPreferences.setString('CACHED_USER', jsonEncode(userModerToJson));
    return Future.value(unit);
  }

  @override
  Future<List<UserModel>> getChachedFriends() {
    final jsonString = sharedPreferences.getString('CACHED_USERS');
    if (jsonString != null) {
      List decodejsonData = jsonDecode(jsonString);
      List<UserModel> jsonTouserModel = decodejsonData
          .map<UserModel>((jsonUserModel) => UserModel.fromJson(jsonUserModel))
          .toList();
      return Future.value(jsonTouserModel);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<UserModel> getChachedUser() {
    final jsonString = sharedPreferences.getString('CACHED_USER');
    if (jsonString != null) {
      UserModel decodejsonData = jsonDecode(jsonString);
      return Future.value(decodejsonData);
    } else {
      throw EmptyCacheException();
    }
  }
}
