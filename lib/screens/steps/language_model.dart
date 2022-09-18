class Language {
  late final int id;
  late final String name;

  Language({
    required this.id,
    required this.name,
  });
  
  @override
  String toString() {
    return this.name;
  }

}