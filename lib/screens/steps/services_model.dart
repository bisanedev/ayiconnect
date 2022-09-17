class Services {
  final int? id;
  final String? name;

  Services({
    this.id,
    this.name,
  });
  
  Map<String, dynamic> toJson() => {"id":id,"name": name};
}