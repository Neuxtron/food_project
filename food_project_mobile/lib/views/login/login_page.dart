import 'package:flutter/material.dart';
import 'package:food_project/views/widgets/auth_input.dart';
import 'package:food_project/views/layouts/auth_layout.dart';
import 'package:food_project/views/widgets/cu_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _namaController = TextEditingController();
  final _passwordController = TextEditingController();

  void submitLogin() {}

  @override
  void dispose() {
    super.dispose();
    _namaController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(.01),
        elevation: 0,
      ),
      body: AuthLayout(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 130, bottom: 50),
            child: Text(
              "Masuk Akun",
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
            label: "Kata Sandi",
            hintText: "Masukkan kata sandi",
            controller: _passwordController,
            isPassword: true,
          ),
          CuButton(
            onPressed: submitLogin,
            margin: const EdgeInsets.symmetric(vertical: 70),
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
                "Belum punya akun? ",
                style: TextStyle(color: Colors.white),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, "/daftar"),
                child: const Text(
                  "Daftar",
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
      ),
    );
  }
}
