import 'package:flutter/material.dart';
import 'package:food_project/models/user_model.dart';
import 'package:food_project/viewmodels/kecamatan_view_model.dart';
import 'package:food_project/viewmodels/user_view_model.dart';
import 'package:food_project/views/daftar/kecamatan_dropdown.dart';
import 'package:food_project/views/widgets/auth_input.dart';
import 'package:food_project/views/layouts/auth_layout.dart';
import 'package:food_project/views/widgets/cu_button.dart';
import 'package:food_project/views/widgets/error_text.dart';
import 'package:provider/provider.dart';

class DaftarPage extends StatefulWidget {
  const DaftarPage({super.key});

  @override
  State<DaftarPage> createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  final _namaController = TextEditingController();
  final _teleponController = TextEditingController();
  final _passwordController = TextEditingController();
  final _alamatController = TextEditingController();

  int? _idKecamatan;
  bool _loading = false;
  String _error = "";

  bool validate() {
    if (_namaController.text.isEmpty) {
      setState(() => _error = "Nama tidak boleh kosong");
      return false;
    }
    if (_teleponController.text.isEmpty) {
      setState(() => _error = "No HP tidak boleh kosong");
      return false;
    }
    if (_passwordController.text.isEmpty) {
      setState(() => _error = "Password tidak boleh kosong");
      return false;
    }
    if (_alamatController.text.isEmpty) {
      setState(() => _error = "Alamat tidak boleh kosong");
      return false;
    }
    if (_idKecamatan == null) {
      setState(() => _error = "Kecamatan tidak boleh kosong");
      return false;
    }

    return true;
  }

  void submitDaftar() {
    if (!validate()) return;
    setState(() {
      _loading = true;
      _error = "";
    });
    final user = UserModel(
      nama: _namaController.text.trim(),
      hp: _teleponController.text,
      alamat: _alamatController.text.trim(),
      password: _passwordController.text,
      idKecamatan: _idKecamatan,
    );
    context.read<UserViewModel>().register(user).then((error) {
      setState(() {
        _loading = false;
        _error = error;
      });
      if (error.isEmpty) Navigator.pop(context);
    });
  }

  void getKecamatan() {
    context.read<KecamatanViewModel>().getKecamatan().then((_) {
      final listKecamatan = context.read<KecamatanViewModel>().listKecamatan;
      if (listKecamatan.isNotEmpty) {
        setState(() => _idKecamatan = listKecamatan.first.id);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getKecamatan();
  }

  @override
  void dispose() {
    super.dispose();
    _namaController.dispose();
    _passwordController.dispose();
    _teleponController.dispose();
    _alamatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 130, bottom: 50),
          child: Text(
            "Daftar Akun",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        ErrorText(error: _error),
        AuthInput(
          label: "Nama Pengguna",
          hintText: "Nama lengkap",
          controller: _namaController,
          keyboardType: TextInputType.name,
        ),
        AuthInput(
          label: "Nomor Telepon",
          hintText: "08236xxxxxxxx",
          controller: _teleponController,
          keyboardType: TextInputType.phone,
        ),
        AuthInput(
          label: "Kata Sandi",
          hintText: "Masukkan kata sandi",
          controller: _passwordController,
          isPassword: true,
        ),
        AuthInput(
          label: "Alamat",
          hintText: "Masukkan alamat",
          controller: _alamatController,
          multiline: true,
        ),
        KecamatanDropdown(
          onChange: (value) => setState(() => _idKecamatan = value),
          value: _idKecamatan,
        ),
        CuButton(
          onPressed: submitDaftar,
          margin: const EdgeInsets.only(top: 0, bottom: 30),
          loading: _loading,
          child: const Text(
            "Daftar",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sudah punya akun? ",
              style: TextStyle(color: Colors.white),
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
