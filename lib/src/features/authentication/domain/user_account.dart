// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'dart:convert';

class UserAccount {
  UserAccount({
    required this.fullname,
    required this.email,
    required this.password,
    required this.occupation,
    required this.age,
    this.imageProfile = '',
  });

  factory UserAccount.fromJson(String source) =>
      UserAccount.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserAccount.fromMap(Map<String, dynamic> map) {
    return UserAccount(
      fullname: map['fullname'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      occupation: map['occupation'] as String,
      age: map['age'] as String,
      imageProfile: map['imageProfile'] as String,
    );
  }

  String fullname;
  String email;
  String password;
  String occupation;
  String age;
  String imageProfile;

  @override
  String toString() {
    return 'UserAccount(fullname: $fullname, email: $email, password: $password, occupation: $occupation, age: $age, imageProfile: $imageProfile)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'email': email,
      'password': password,
      'occupation': occupation,
      'age': age,
      'imageProfile': imageProfile,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(covariant UserAccount other) {
    if (identical(this, other)) return true;

    return other.fullname == fullname &&
        other.email == email &&
        other.password == password &&
        other.occupation == occupation &&
        other.age == age &&
        other.imageProfile == imageProfile;
  }

  @override
  int get hashCode {
    return fullname.hashCode ^
        email.hashCode ^
        password.hashCode ^
        occupation.hashCode ^
        age.hashCode ^
        imageProfile.hashCode;
  }
}
