import 'package:flutter/material.dart';
import 'package:food_project/views/widgets/auth_input.dart';
import 'package:food_project/views/layouts/auth_layout.dart';
import 'package:food_project/views/widgets/cu_button.dart';

class DaftarPage extends StatefulWidget {
  const DaftarPage({super.key});

  @override
  State<DaftarPage> createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  final _namaController = TextEditingController();
  final _nomorController = TextEditingController();
  final _passwordController = TextEditingController();
  final _alamatController = TextEditingController();

  void submitDaftar() {}

  @override
  void dispose() {
    super.dispose();
    _namaController.dispose();
    _passwordController.dispose();
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
        AuthInput(
          label: "Nama Pengguna",
          hintText: "Nama lengkap",
          controller: _namaController,
          keyboardType: TextInputType.name,
        ),
        AuthInput(
          label: "Nomor Telepon",
          hintText: "08236xxxxxxxx",
          controller: _nomorController,
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
        CuButton(
          onPressed: submitDaftar,
          margin: const EdgeInsets.only(top: 0, bottom: 30),
          child: const Text(
            "Masuk Akun",
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
