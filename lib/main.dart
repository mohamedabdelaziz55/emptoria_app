import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/routes/app_route.dart';

late SharedPreferences sp;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sp = await SharedPreferences.getInstance();
  await Supabase.initialize(
    url: "https://jxgolqopszymhquzusdi.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4Z29scW9wc3p5bWhxdXp1c2RpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI1NTQ5MDUsImV4cCI6MjA2ODEzMDkwNX0.8hVJLqNKIeC4cL1xeoY2aiYJCV3i4_PoaA9VU5FpYjQ",
  );
  runApp( ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final _appRouter =  AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(iconTheme: const IconThemeData(color: Colors.grey)),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
