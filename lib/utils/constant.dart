import 'package:flutter/material.dart';
// Using locally-bundled fonts (defined in pubspec.yaml). Replace GoogleFonts runtime usage
// with direct fontFamily references to avoid remote font fetches on first load.

var image =
    'https://scontent.fcgp17-1.fna.fbcdn.net/v/t39.30808-6/432934437_379672724910396_8625477020084735141_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeG5BsXZvr2Sg6GlHC8y6Se1LhOu4QnDi98uE67hCcOL33QU7tkhiOymrj4PTEF3bxUKl3EBOsDIKYGCc6rHW1Xw&_nc_ohc=k6czQtmUyh0Q7kNvgHwtgbY&_nc_ht=scontent.fcgp17-1.fna&oh=00_AYBc7JWboKXLTOC7OGXq6fBCddNBmLzQvYdv6HZUbL83TQ&oe=66C75C94';

double getMaxHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getMaxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

// Academic / Professional palette with proper roles
const Color _background =
    Color(0xFFF4F6F8); // Primary background (off-white paper)
// Secondary background for accents
const Color _primary = Color(0xFF0B2D5B); // Primary for headings and main CTAs
const Color _secondary =
    Color(0xFFB7882E); // Secondary for accents and secondary CTAs
const Color _bodyText = Color(0xFF1E293B); // Body text color
const Color _darkBackground = Color(0xFF071427); // Dark mode background
const Color _darkSurface = Color(0xFF0F2233); // Dark mode surface
const Color _darkPrimary = Color(0xFF9FBFF0); // Dark mode primary
const Color _darkSecondary = Color(0xFFD6C29A); // Dark mode secondary
const Color _darkBodyText = Color(0xFFE6EAF4); // Dark mode body text

// Public aliases for use across the app
const Color kPrimaryColor = _primary;
const Color kSecondaryColor = _secondary;
const Color kBackgroundColor = _background;
const Color kSurfaceColor = Colors.white;
const Color kDarkPrimaryColor = _darkPrimary;
const Color kDarkSecondaryColor = _darkSecondary;
const Color kDarkBackgroundColor = _darkBackground;
const Color kDarkSurfaceColor = _darkSurface;
const Color kDarkBodyText = _darkBodyText;

final TextTheme _lightTextTheme = ThemeData.light()
    .textTheme
    .apply(
      bodyColor: _bodyText,
      displayColor: _primary,
    )
    .copyWith(
      bodyLarge:
          ThemeData.light().textTheme.bodyLarge?.copyWith(fontFamily: 'Lora'),
      bodyMedium:
          ThemeData.light().textTheme.bodyMedium?.copyWith(fontFamily: 'Lora'),
      headlineSmall: ThemeData.light()
          .textTheme
          .headlineSmall
          ?.copyWith(fontFamily: 'Lora'),
    );

final TextTheme _darkTextTheme = ThemeData.dark()
    .textTheme
    .apply(
      bodyColor: _darkBodyText,
      displayColor: _darkPrimary,
    )
    .copyWith(
      bodyLarge:
          ThemeData.dark().textTheme.bodyLarge?.copyWith(fontFamily: 'Lora'),
      bodyMedium:
          ThemeData.dark().textTheme.bodyMedium?.copyWith(fontFamily: 'Lora'),
      headlineSmall: ThemeData.dark()
          .textTheme
          .headlineSmall
          ?.copyWith(fontFamily: 'Lora'),
    );

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: _background,
  cardColor: Colors.white,
  textTheme: _lightTextTheme,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: _primary,
    onPrimary: Colors.white,
    secondary: _secondary,
    onSecondary: Colors.white,
    error: Color(0xFFB3261E),
    onError: Colors.white,
    background: _background,
    onBackground: _bodyText,
    surface: Colors.white,
    onSurface: _bodyText,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: _primary,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      textStyle: const TextStyle(
        fontFamily: 'Lora',
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: _primary,
      textStyle: const TextStyle(
        fontFamily: 'Lora',
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    color: _primary,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: _darkBackground,
  cardColor: _darkSurface,
  textTheme: _darkTextTheme,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: _darkPrimary,
    onPrimary: _darkBackground,
    secondary: _darkSecondary,
    onSecondary: _darkBackground,
    error: Color(0xFFF2B8B5),
    onError: Color(0xFF601410),
    background: _darkBackground,
    onBackground: _darkBodyText,
    surface: _darkSurface,
    onSurface: _darkBodyText,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: _darkPrimary,
      foregroundColor: _darkBackground,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      textStyle: const TextStyle(
        fontFamily: 'Lora',
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: _darkPrimary,
      textStyle: const TextStyle(
        fontFamily: 'Lora',
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    color: _darkPrimary,
  ),
);
