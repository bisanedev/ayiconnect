class Language {
  final int? id;
  final String? name;

  Language({
    this.id,
    this.name,
  });
  Map<String, dynamic> toJson() => {"id":id,"name": name};
}