class ProdukModel {
  final int id;
  final String nama;
  final int harga;
  final List<String> gambar;
  final String deskripsi;
  final int idKategori;

  ProdukModel({
    required this.id,
    required this.nama,
    required this.harga,
    required this.gambar,
    required this.deskripsi,
    required this.idKategori,
  });
}
