import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var image =
    'https://scontent.fcgp17-1.fna.fbcdn.net/v/t39.30808-6/432934437_379672724910396_8625477020084735141_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeG5BsXZvr2Sg6GlHC8y6Se1LhOu4QnDi98uE67hCcOL33QU7tkhiOymrj4PTEF3bxUKl3EBOsDIKYGCc6rHW1Xw&_nc_ohc=k6czQtmUyh0Q7kNvgHwtgbY&_nc_ht=scontent.fcgp17-1.fna&oh=00_AYBc7JWboKXLTOC7OGXq6fBCddNBmLzQvYdv6HZUbL83TQ&oe=66C75C94';

double getMaxHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getMaxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF66FCF1),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0XFF4E31AA), // Replaces accentColor
  ),
  scaffoldBackgroundColor: const Color(0XFFF7F7F8),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color.fromARGB(255, 105, 99, 99)),
    bodyMedium: TextStyle(color: Color(0xFF757575)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0XFF3795BD), // Replaces primary
      foregroundColor: Colors.white, // Replaces onPrimary
    ),
  ),
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0XFF6fffe9),
  canvasColor: const Color(0XFF5bc0be),
  colorScheme: const ColorScheme.dark().copyWith(
    secondary: const Color(0xFFC5C6C7),
  ),
  scaffoldBackgroundColor: const Color(0XFF0b132b),
  cardColor: const Color(0XFF3a506b),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.poppins(color: const Color(0XFF6fffe9)),
    bodyMedium:
        GoogleFonts.poppins(color: const Color.fromARGB(255, 255, 255, 255)),
    bodySmall: GoogleFonts.poppins(color: const Color(0xFFC5C6C7)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0XFF0B0C10),
      foregroundColor: Colors.black,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color(0XFF6fffe9),
  ),
);
