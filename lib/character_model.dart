class Character {
  final String id;
  final String name;
  final String house;
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.house,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      house: json['house'],
      image: json['image'],
    );
  }
}