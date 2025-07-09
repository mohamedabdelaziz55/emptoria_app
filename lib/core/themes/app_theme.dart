// import 'package:flutter/material.dart';
//
// import '../utils/app_colors.dart';
// ;
//
// class AppTheme {
//   static ThemeData lightTheme = ThemeData(
//     textTheme: TextTheme(
//       // العناوين الكبيرة (Inter) - Bold
//       displayLarge: GoogleFonts.inter(
//         fontSize: 32,
//         fontWeight: FontWeight.bold,
//       ),
//       displayMedium: GoogleFonts.inter(
//         fontSize: 28,
//         fontWeight: FontWeight.bold,
//       ),
//       displaySmall: GoogleFonts.inter(
//         fontSize: 24,
//         fontWeight: FontWeight.bold,
//       ),
//
//       // العناوين الرئيسية (Alegreya Sans) - Bold
//       headlineLarge: GoogleFonts.alegreyaSans(
//         fontSize: 22,
//         fontWeight: FontWeight.bold,
//       ),
//       headlineMedium: GoogleFonts.alegreyaSans(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//       ),
//       headlineSmall: GoogleFonts.alegreyaSans(
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//       ),
//
//       // العناوين الفرعية (Montserrat) - Medium
//       titleLarge: GoogleFonts.montserrat(
//         fontSize: 16,
//         fontWeight: FontWeight.w500,
//       ),
//       titleMedium: GoogleFonts.montserrat(
//         fontSize: 14,
//         fontWeight: FontWeight.w500,
//       ),
//       titleSmall: GoogleFonts.montserrat(
//         fontSize: 12,
//         fontWeight: FontWeight.w500,
//       ),
//
//       // النصوص الأساسية (Alegreya Sans) - Regular
//       bodyLarge: GoogleFonts.alegreyaSans(
//         fontSize: 16,
//       ),
//       bodyMedium: GoogleFonts.alegreyaSans(
//         fontSize: 14,
//       ),
//       bodySmall: GoogleFonts.alegreyaSans(
//         fontSize: 12,
//       ),
//
//       // النصوص الصغيرة (Labels - Montserrat)
//       labelLarge: GoogleFonts.montserrat(
//         fontSize: 14,
//       ),
//       labelMedium: GoogleFonts.montserrat(
//         fontSize: 12,
//       ),
//       labelSmall: GoogleFonts.montserrat(
//         fontSize: 10,
//       ),
//     ),
//     useMaterial3: true,
//     brightness: Brightness.light,
//     colorScheme: ColorScheme.fromSeed(
//       seedColor: AppColors.mainColor,
//       brightness: Brightness.light,
//       primary: AppColors.mainColor,
//       secondary: AppColors.secondColor,
//       error: AppColors.errorRed,
//       background: Colors.white,
//       surface: Colors.white,
//     ),
//     appBarTheme: const AppBarTheme(
//       centerTitle: true,
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       foregroundColor: Colors.white,
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.mainColor,
//         foregroundColor: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     ),
//     cardTheme: CardThemeData(
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       fillColor: AppColors.text,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide.none,
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide(color: Colors.grey.shade300),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: const BorderSide(color: AppColors.white, width: 2),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: const BorderSide(color: AppColors.errorRed, width: 1),
//       ),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//     ),
//   );
//
//   static ThemeData darkTheme = ThemeData(
//     useMaterial3: true,
//     brightness: Brightness.dark,
//     colorScheme: ColorScheme.fromSeed(
//       seedColor: AppColors.secondColor,
//       brightness: Brightness.dark,
//       primary: AppColors.secondColor,
//       secondary: AppColors.secondColor,
//       error: AppColors.errorRed,
//       background: AppColors.lightBlack,
//       surface: AppColors.mainColor,
//     ),
//     scaffoldBackgroundColor: AppColors.darkBlack,
//     appBarTheme: const AppBarTheme(
//       centerTitle: true,
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       foregroundColor: Colors.white,
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.mainColor,
//         foregroundColor: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     ),
//     cardTheme: CardThemeData(
//       elevation: 2,
//       color: AppColors.text,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//     ),
// textTheme: TextTheme(
//
//   bodyLarge: GoogleFonts.amiri(
//     textStyle: const TextStyle(
//       color: AppColors.text
//     )
//   ),
//   bodyMedium:  GoogleFonts.amiri(
//       textStyle: const TextStyle(
//           color: AppColors.text
//       )
//   ),
//   bodySmall:  GoogleFonts.amiri(
//       textStyle: const TextStyle(
//           color: AppColors.text
//       )
//   ),
//   displayLarge:  GoogleFonts.amiri(
//       textStyle: const TextStyle(
//           color: AppColors.text
//       )
//   ),
//   displayMedium:  GoogleFonts.amiri(
//       textStyle: const TextStyle(
//           color: AppColors.text
//       )
//   ),
//   displaySmall:  GoogleFonts.amiri(
//       textStyle: const TextStyle(
//           color: AppColors.text
//       )
//   ),
//   headlineLarge:  GoogleFonts.amiri(
//       textStyle: const TextStyle(
//           color: AppColors.text
//       )
//   ),
//   headlineMedium:  GoogleFonts.amiri(
//       textStyle: const TextStyle(
//           color: AppColors.text
//       )
//   ),
//   headlineSmall:  GoogleFonts.amiri(
//       textStyle: const TextStyle(
//           color: AppColors.text
//       )
//   ),
//   labelLarge:  GoogleFonts.amiri(
//       textStyle: const TextStyle(
//           color: AppColors.text
//       )
//   ),
//   labelMedium:  GoogleFonts.amiri(
//       textStyle: const TextStyle(
//           color: AppColors.text
//       )
//   ),
//   labelSmall:  GoogleFonts.amiri(
//       textStyle: const TextStyle(
//           color: AppColors.text
//       )
//   ),
//   titleLarge:  GoogleFonts.amiri(
//       textStyle: const TextStyle(
//           color: AppColors.text
//       )
//   ),
//   titleMedium:  GoogleFonts.amiri(
//       textStyle: const TextStyle(
//           color: AppColors.text
//       )
//   ),
//   titleSmall:  GoogleFonts.amiri(
//       textStyle: const TextStyle(
//           color: AppColors.text
//       )
//   ),
//
// ),
//     inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       fillColor: AppColors.text,
//       hintStyle: const TextStyle(color: AppColors.textSecondary),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide.none,
//       ),
//       enabledBorder: OutlineInputBorder(
//
//         borderRadius: BorderRadius.circular(8),
//         borderSide: const BorderSide(color: AppColors.textSecondary),
//       ),
//       focusedBorder: OutlineInputBorder(
//
//         borderRadius: BorderRadius.circular(8),
//         borderSide: const BorderSide(color: AppColors.textSecondary, width: 2),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: const BorderSide(color: AppColors.errorRed, width: 1),
//       ),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//     ),
//   );
// }
