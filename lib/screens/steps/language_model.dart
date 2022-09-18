class Language {
  late final int id;
  late final String name;

  Language({
    required this.id,
    required this.name,
  });
  Map<String, dynamic> toJson() => {"id":id,"name": name};
}