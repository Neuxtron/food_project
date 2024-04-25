class ProdukModel {
  final int id;
  final String nama;
  final int harga;
  final List<String> gambar;
  final double rating;
  final int ratingCount;

  ProdukModel({
    required this.id,
    required this.nama,
    required this.harga,
    required this.gambar,
    required this.rating,
    required this.ratingCount,
  });

  String get formattedRatingCount {
    final newCount = ratingCount > 25 ? "25+" : ratingCount;
    return "($newCount)";
  }
}
