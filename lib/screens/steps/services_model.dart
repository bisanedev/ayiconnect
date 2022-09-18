class Services {
  late final int id;
  late final String name;

  Services({
    required this.id,
    required this.name,
  });
  
  Map<String, dynamic> toJson() => {"id":id,"name": name};
}