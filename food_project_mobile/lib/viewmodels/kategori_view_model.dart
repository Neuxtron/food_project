import 'package:flutter/material.dart';
import 'package:food_project/models/kategori_model.dart';

class KategoriViewModel extends ChangeNotifier {
  List<KategoriModel> _listKategori = [];
  List<KategoriModel> get listKategori => _listKategori;
}
