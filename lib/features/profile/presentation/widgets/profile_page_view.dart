import 'package:flutter/material.dart';
import '../../../../main.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({super.key});

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  String? email;
  String? name;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final userEmail = sp.getString('user_email');
    final displayName = sp.getString('display_name');

    setState(() {
      email = userEmail;
      name = displayName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(email ?? 'No Email')),
        Center(child: Text(name ?? 'No Name')),


      ],
    );
  }
}
