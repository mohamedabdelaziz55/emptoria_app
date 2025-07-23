import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/routes/app_route.gr.dart';
import '../../../../main.dart';
import '../widgets/profile_page_view.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(icon: Icon(Icons.output), onPressed: () async{
              await Supabase.instance.client.auth.signOut();
              await sp.clear();
              context.replaceRoute(const LoginRoute());
            }),
          ),
        ],
      ),
      body: ProfilePageView(),
    );
  }
}
