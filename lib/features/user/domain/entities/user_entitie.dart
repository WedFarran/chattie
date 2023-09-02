import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String username;
  final int age;
  final DateTime birthday;
  final String nationality;
  final String city;
  final String hobby;
  final String image;
  final List<String> friends;

  const User(
      {required this.id,
      required this.username,
      required this.age,
      required this.birthday,
      required this.nationality,
      required this.city,
      required this.hobby,
      required this.image,
      required this.friends});

  @override
  List<Object?> get props =>
      [id, username, age, birthday, nationality, city, hobby, image, friends];
}
