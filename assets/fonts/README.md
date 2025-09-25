Place local font files here and ensure paths match pubspec.yaml

Recommended files (TTF):
- Montserrat-Regular.ttf
- Montserrat-Bold.ttf
- Lora-Regular.ttf
- Lora-Bold.ttf
- Merriweather-Regular.ttf
- Merriweather-Bold.ttf

If you prefer woff2 for smaller web size you can use those instead, but TTF is fine and commonly used.

After adding files, run:

flutter pub get

Then rebuild web:

flutter build web --release --web-renderer=html

Notes:
- pubspec.yaml already contains font family entries named 'Montserrat', 'Lora', and 'Merriweather'.
- Ensure filenames exactly match the asset paths in pubspec.yaml.
- If you want me to add the font files for you, grant permission and I'll fetch them from open-source Google Fonts sources and add them into this folder.
