// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:chattie/core/error/exception.dart';
import 'package:chattie/features/user/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getAllFriends(List<String> id);
  Future<UserModel> getUserProfile(String id);
  Future<Unit> deleteFriend(String id);
  Future<Unit> addFriend(String id);
  Future<Unit> updateProfile(UserModel user);
  Future<List<UserModel>> searchForFriends(String username);
}

const BASE_URL = "chattieapplication-production.up.railway.app";

class UserRemoteImplWithHttp implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteImplWithHttp({required this.client});
  @override
  Future<Unit> addFriend(String id) async {
    final response = await client.get(Uri.parse("$BASE_URL/friends/"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode != 200) {
      throw ServerException();
    }
    return unit;
  }

  @override
  Future<Unit> deleteFriend(String id) async {
    final response = await client.get(Uri.parse("$BASE_URL/friends/"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode != 200) {
      throw ServerException();
    }
    return unit;
  }

  @override
  Future<List<UserModel>> getAllFriends(List<String> id) async {
    final response = await client.get(Uri.parse("$BASE_URL/friends/"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final List decodeJson = jsonDecode(response.body) as List;
      final List<UserModel> userModels = decodeJson
          .map<UserModel>((jsonUserModel) => UserModel.fromJson(jsonUserModel))
          .toList();
      return userModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getUserProfile(String id) async {
    final response = await client.get(Uri.parse("$BASE_URL/friends/"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final decodeJson = jsonDecode(response.body);
      final UserModel userModels = decodeJson;
      return userModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<UserModel>> searchForFriends(String username) async {
    final response = await client.get(
        Uri.parse("$BASE_URL/search/${username.toString()}"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final List decodeJson = jsonDecode(response.body) as List;
      final List<UserModel> userModels = decodeJson
          .map<UserModel>((jsonUserModel) => UserModel.fromJson(jsonUserModel))
          .toList();
      return userModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateProfile(UserModel user) async {
    final userId = user.id.toString();
    final body = {
      'username': user.username,
      'age': user.age,
      'birthday': user.birthday,
      'city': user.city,
      'hobby': user.hobby,
      'image': user.image,
      'nationality': user.nationality
    };
    final response = await client
        .post(Uri.parse("$BASE_URL/updateProfile/$userId"), body: body);
    if (response.statusCode != 200) {
      throw ServerException();
    }
    return unit;
  }
}
