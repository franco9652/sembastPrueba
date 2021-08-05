import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class User {
  final String id;
  final String name;
  final String email;
  final int age;

  User({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.age,
  });

  static User fake() {
    final String id = DateTime.now().microsecondsSinceEpoch.toString();
    final String name = faker.person.name();
    final String email = faker.internet.email();
    final int age = RandomGenerator().integer(98, min: 18);

    return User(
      id: id,
      name: name,
      email: email,
      age: age,
    );
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "email": this.email,
      "age": this.age
    };
  }
}
