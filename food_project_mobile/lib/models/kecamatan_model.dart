class KecamatanModel {
  final int id;
  final String nama;
  final int ongkir;

  KecamatanModel({
    required this.id,
    required this.nama,
    required this.ongkir,
  });

  factory KecamatanModel.fromJson(Map<String, dynamic> json) {
    return KecamatanModel(
      id: json["id"],
      nama: json["nama"],
      ongkir: json["ongkir"],
    );
  }
}
