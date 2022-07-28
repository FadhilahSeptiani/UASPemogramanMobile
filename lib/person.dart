class Person {
  final String title;

  Person({
    required this.title,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      title: json['title'],
    );
  }
}