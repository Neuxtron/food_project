class KategoriModel {
  final int id;
  final String icon;
  final String title;

  KategoriModel({
    required this.id,
    required this.icon,
    required this.title,
  });

  factory KategoriModel.fromJson(Map<String, dynamic> json) {
    return KategoriModel(
      id: json["id"],
      icon: json["icon"],
      title: json["title"],
    );
  }
}
