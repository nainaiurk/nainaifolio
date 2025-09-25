# Nainaiu Rakhaine - Portfolio

A professional Flutter portfolio showcasing expertise in Electrical and Electronic Engineering, Embedded Systems, IoT, and Autonomous Technologies.

## About

**Nainaiu Rakhaine** is a dedicated Electrical and Electronic Engineering graduate from Shahjalal University of Science and Technology, Sylhet, with a strong foundation in embedded systems, IoT technologies, and autonomous systems. Currently pursuing advanced research in autonomous vehicles and intelligent sensing platforms, he combines academic excellence with practical engineering experience.

### Key Expertise Areas:
- **Embedded Systems & IoT**: Extensive experience in microcontroller programming, sensor integration, and low-power communication protocols
- **Autonomous Systems**: Active contributor to Bangladesh's first Level 2 autonomous vehicle initiative, focusing on perception, actuation, and safety systems
- **Technical Communication**: Producing industry-grade content for global engineering communities, specializing in PCB design and embedded firmware tutorials
- **Cross-Disciplinary Skills**: Proficient in modern development frameworks alongside traditional engineering tools

### Technical Skills:
- **Programming**: Python (88%), Flutter (90%), C/C++ for embedded systems
- **Hardware**: PCB Design (85%), Microcontrollers (80%), RTOS (75%)
- **Tools**: MATLAB (70%), AutoCAD (60%), TinyML (65%)
- **Specializations**: Autonomous Vehicles, IoT Platforms, Edge Intelligence

## Features

- **Responsive Design**: Optimized for mobile, tablet, and desktop viewing
- **Interactive Elements**: Smooth animations and transitions
- **Professional Sections**: Experience, Skills, Projects, Publications, and Contact
- **Modern UI**: Clean, professional design with dark/light theme support

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone https://github.com/nainaiurk/nainaifolio.git
cd nainaifolio
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                 # Application entry point
├── screens/
│   └── home_screen.dart      # Main portfolio screen
├── widgets/                  # Reusable UI components
│   ├── animated_header.dart
│   ├── contact_section.dart
│   ├── education_section.dart
│   ├── experience_section.dart
│   ├── footer.dart
│   ├── introduction_section.dart
│   ├── projects_section.dart
│   ├── publications_section.dart
│   ├── skills_section.dart
│   └── expertise_areas_section.dart
├── models/                   # Data models
└── utils/                    # Utilities and constants
```

## Technologies Used

- **Framework**: Flutter
- **Language**: Dart
- **UI Components**: Material Design
- **Icons**: Font Awesome Flutter
- **Fonts**: Google Fonts (Lora)
- **Animations**: Animated Text Kit

## Contact

- **Email**: nainaiu.rakhaine@gmail.com
- **LinkedIn**: [Nainaiu Rakhaine](https://www.linkedin.com/in/nainaiu-rakhaine)
- **WhatsApp**: +8801605544977

## Web OAuth Setup (Gmail send)

If you plan to deploy the app as a web application and use the client-side Gmail send flow, follow these steps:

- Register an OAuth 2.0 client in Google Cloud Console of type `Web application`.
- Add your deployed domain and any local testing origins (for example `http://localhost:5000`) to **Authorized JavaScript origins**.
- Use the generated Web client ID when testing the Google Sign-In flow in the browser.
- For development, keep the OAuth consent in **Testing** and add your Google account as a test user.
- Optionally add a meta tag to `web/index.html` with the Web client ID:

```html
<meta name="google-signin-client_id" content="YOUR_WEB_CLIENT_ID.apps.googleusercontent.com">
```

Notes:
- The app uses `google_sign_in` with the `gmail.send` scope. The user must sign in and grant permission to send email on their behalf.
- If you do not want users to sign in, consider a server-side sending endpoint instead.

Security note:
- Do NOT commit `client_secret_*.json` files or any client secret to source control. The web flow only needs the **Web client ID** (public); the client secret in your downloaded JSON is for server-side use only.

## License

This project is open source and available under the [MIT License](LICENSE).