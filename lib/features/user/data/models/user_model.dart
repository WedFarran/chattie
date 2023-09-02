import '../../domain/entities/user_entitie.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.username,
      required super.age,
      required super.birthday,
      required super.nationality,
      required super.city,
      required super.hobby,
      required super.image,
      required super.friends});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        username: json['username'],
        age: json['age'],
        birthday: json['birthday'],
        nationality: json['nationality'],
        city: json['city'],
        hobby: json['hobby'],
        image: json['image'],
        friends: json['friends']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'age': age,
      'birthday': birthday,
      'nationality': nationality,
      'city': city,
      'hobby': hobby,
      'image': image,
      'friends': friends
    };
  }
}
