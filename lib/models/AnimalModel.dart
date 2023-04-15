class Animal {
  final String name;
  final int age;
  final String color;
  final bool haveLeg;

  Animal(
      {required this.name,
      required this.age,
      required this.color,
      required this.haveLeg});

  factory Animal.jsonDecode(Map<String, dynamic> map) => Animal(
        name: map['name'],
        age: map['age'],
        color: map['color'],
        haveLeg: map['haveLeg'],
      );
}
