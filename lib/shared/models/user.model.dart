import 'package:flutter/foundation.dart';

@immutable
class User {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    assert(
      map['id'] != null && map['id'] is String,
      'the key `id` should be a non-null String value',
    );
    assert(
      map['name'] != null && map['name'] is String,
      'the key `name` should be a non-null String value',
    );
    assert(
      map['email'] != null && map['email'] is String,
      'the key `email` should be a non-null String value',
    );
    assert(
      (map['avatar_url'] != null && map['avatar_url'] is String) ||
          (map['avatarUrl'] != null && map['avatarUrl'] is String),
      'the key `avatar_url` or `avatarUrl` should be a non-null String value',
    );

    final id = map['id'];
    final name = map['name'];
    final email = map['email'];
    final avatarUrl = map['avatar_url'] ?? map['avatarUrl'];

    return User(
      id: id as String,
      name: name as String,
      email: email as String,
      avatarUrl: avatarUrl as String,
    );
  }

  final String id;

  final String name;

  final String email;

  final String avatarUrl;

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? avatarUrl,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
