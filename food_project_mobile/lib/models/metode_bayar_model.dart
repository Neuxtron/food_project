class MetodeBayarModel {
  final int id;
  final String nama;
  final String gambar;

  MetodeBayarModel({
    required this.id,
    required this.nama,
    required this.gambar,
  });

  factory MetodeBayarModel.fromJson(Map<String, dynamic> json) {
    return MetodeBayarModel(
      id: json["id"],
      nama: json["nama"],
      gambar: json["gambar"],
    );
  }
}
