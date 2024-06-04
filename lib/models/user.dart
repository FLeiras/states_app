class User {
  final String name;
  final int age;
  final List<String> profesion;

  User({
    required this.name,
    required this.age,
    required this.profesion,
  });

  User copyWith({
    String? name,
    int? age,
    List<String>? profesion,
  }) =>
      User(
        name: name ?? this.name,
        age: age ?? this.age,
        profesion: profesion ?? this.profesion,
      );
}
