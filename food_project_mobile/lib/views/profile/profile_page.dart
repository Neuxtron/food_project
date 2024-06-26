import 'package:flutter/material.dart';
import 'package:food_project/viewmodels/user_view_model.dart';
import 'package:food_project/views/profile/profile_item.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserViewModel>().getProfil();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserViewModel>().user;

    return Stack(
      children: [
        Image.asset(
          "assets/images/bg_profile.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Image.asset(
                  "assets/images/foto_profil.png",
                  width: 100,
                ),
              ),
              ProfileItem(
                label: "User Name",
                value: user?.nama,
              ),
              ProfileItem(
                label: "Phone",
                value: user?.hp,
              ),
              ProfileItem(
                label: "Location",
                value: user?.kecamatan,
              ),
            ],
          ),
        )
      ],
    );
  }
}
