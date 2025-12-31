// Portfolio Data
const portfolioData = {
  hero: {
    name: "NAINAIU RAKHAINE",
    title: "B.Sc. in Electrical and Electronic Engineering",
    tagline: "Welcome to Nainai's Portfolio",
    greeting: "Hello:)",
    image: "assets/images/me.png",
    cvUrl: "https://drive.google.com/file/d/1ikAex_odO75MeP2dYGRD7N0IP76JqhAZ/view?usp=sharing",
    socials: [
      { platform: "Google Scholar", icon: "fa-graduation-cap", url: "https://scholar.google.com/citations?user=U_HtJbQAAAAJ&hl=en" },
      { platform: "LinkedIn", icon: "fa-linkedin", url: "https://www.linkedin.com/in/nainaiu-rakhaine" },
      { platform: "GitHub", icon: "fa-github", url: "https://github.com/nainaiurk" }
    ]
  },
  introduction: {
    title: "Hi, I'm Nainaiu Rakhaine,",
    paragraphs: [
      "I am an Electrical and Electronics Engineering graduate focused on embedded systems and electronics design. My work includes microcontroller-based systems, custom PCBA development, and applied projects in IoT and intelligent sensing.",
      "My research interests center on wearable and human-centered embedded systems, including wearable sensing, biosignal acquisition, and low-power embedded intelligence. I aim to contribute to research and development that bridges embedded hardware with real-world human applications."
    ]
  },
  expertiseAreas: [
    {
      icon: "fa-microchip",
      label: "Embedded Systems & IoT",
      description: "Can design System on Chip(SoC) devices using compact PCB design. Integrate to low-power ESP32/STM32 platforms, IoT pipelines, and resilient data acquisition for ready autonomous systems.",
      color: "#1A2B4C"
    },
    {
      icon: "fa-robot",
      label: "Robotics Systems",
      description: "Integrated perception, control, and hardware stacks for Autonomous Ground Vehicle and AUV teams, delivering reliable robotics modules at scale.",
      color: "#25385C"
    },
    {
      icon: "fa-brain",
      label: "TinyML & Edge Intelligence",
      description: "Deploying TinyML frameworks for low powered embedded devices (Microcontrollers) optimizing edge inference for sustainable monitoring.",
      color: "#3B4F73"
    },
    {
      icon: "fa-pen-nib",
      label: "Publications & Technical Writing",
      description: "Authoring Q2 journal and IEEE conference papers while developing instructional PCB design content for academic and industry learners.",
      color: "#51658C"
    }
  ],
  about: "Specialized expertise in embedded systems development, IoT solutions, and hardware-software integration",
  experience: [
    {
      role: "Electronics Engineer",
      organization: "JLCPCB",
      organizationLink: "https://jlcpcb.com",
      logo: "assets/images/jlcpcb_logo.png",
      period: "Sep 2025 - Present",
      location: "Remote",
      highlights: [
        "Author detailed design guides spanning advanced PCB layout, PCBA, and SMT workflows.",
        "Collaborate with engineer teams to validate reference designs prior to publication for engineering audiences."
      ]
    },
    {
      role: "Research Assistant",
      organization: "Embedded Systems Lab, SUST",
      logo: "assets/images/sust_logo.png",
      period: "Jul 2023 - Present",
      location: "Sylhet, Bangladesh",
      supervisor: "Assoc. Prof. Dr. Md Rashedujjaman",
      professorLink: "https://www.sust.edu/departments/eee/faculty/mrased-eee@sust.edu",
      highlights: [
        "Engineered a custom ESP32-S3 data logger adopted across ongoing research projects and student training cohorts.",
        "Integrated low-power MQTT communication into an IoT-enabled P10 notice board to streamline campus messaging."
      ]
    },
    {
      role: "Research Assistant",
      organization: "Sustainable Energy & IoT Group, SUST",
      logo: "assets/images/sust_logo.png",
      period: "Jun 2022 - Present",
      location: "Sylhet, Bangladesh",
      supervisor: "Asst. Prof. Arif Ahammad",
      professorLink: "https://www.sust.edu/departments/eee/faculty/arif-eee@sust.edu",
      highlights: [
        "Built a multimodal biometric attendance platform (face + fingerprint) deployed at university events for secure access control.",
        "Developed a hybrid solar-wind IoT monitoring node with efficient telemetry for off-grid environmental sensing."
      ]
    },
    {
      role: "Research Assistant",
      organization: "Autonomous Vehicle Research Group, SUST",
      logo: "assets/images/sust_logo.png",
      period: "Jul 2024 - 2025",
      location: "Sylhet, Bangladesh",
      supervisor: "Prof. Dr. Mohammad Shahidur Rahman",
      professorLink: "https://www.sust.edu/departments/cse/faculty/rahmanms@sust.edu",
      highlights: [
        "Delivered sensor-integration and control modules that enabled reliable two-passenger autonomous operation.",
        "Coordinated embedded software validation across perception, actuation, and safety subsystems to meet research milestones."
      ]
    }
  ],
  education: {
    degree: "B.Sc. Engineering in Electrical and Electronic Engineering",
    institution: "Shahjalal University of Science and Technology, Sylhet",
    duration: "2020 - 2025",
    description: "Focused on Digital Electronics, Digital Signal Processing, VLSI, Embedded Systems, Robotics",
    institutionUrl: "https://www.sust.edu/",
    logo: "assets/images/sust_logo.png"
  },
  skills: {
    "Embedded Development Tools": [
      { label: "PlatformIO", level: 0.85 },
      { label: "STM32CubeIDE", level: 0.8 },
      { label: "Arduino IDE", level: 0.9 }
    ],
    "Microcontrollers & Microprocessors": [
      { label: "ESP32", level: 0.88 },
      { label: "STM32", level: 0.85 },
      { label: "Raspberry Pi Pico", level: 0.75 },
      { label: "Raspberry Pi", level: 0.75 },
      { label: "Jetson Nano", level: 0.75 }
    ],
    "RTOS & Embedded ML": [
      { label: "FreeRTOS", level: 1.0 },
      { label: "TensorFlow Lite", level: 0.8 }
    ],
    "IoT & Communication Protocols": [
      { label: "MQTT", level: 0.85 },
      { label: "LoRa", level: 0.75 },
      { label: "BLE", level: 0.8 },
      { label: "WiFi", level: 0.88 },
      { label: "GSM", level: 0.7 }
    ],
    "Programming Languages": [
      { label: "C/C++", level: 0.9 },
      { label: "Python", level: 0.85 },
      { label: "MATLAB", level: 0.75 }
    ],
    "PCB Design & CAD Tools": [
      { label: "EasyEDA", level: 0.85 },
      { label: "Altium Designer", level: 0.75 },
      { label: "AutoCAD", level: 0.7 },
      { label: "FreeCAD", level: 0.65 }
    ],
    "Simulation & Analysis": [
      { label: "LTSpice", level: 0.8 },
      { label: "Proteus", level: 0.75 },
      { label: "MATLAB Simulink", level: 0.7 }
    ],
    "Currently Learning": [
      { label: "FPGA", level: 0.4 },
      { label: "Rust", level: 0.3 },
      { label: "Zephyr RTOS", level: 0.25 }
    ]
  },
  projects: [
    {
      title: "TinyML Motor Fault Detection",
      subtitle: "Undergraduate Thesis (TinyML on MCU)",
      remark: "Completed",
      imageUrl: "https://lh3.googleusercontent.com/d/1eEfWUCyVWYl83sLXorKyXWMe5lDpqyGy",
      description: "Developed a TinyML-based fault detection pipeline for induction motors, optimized for deployment on a low-power microcontroller. Focused on reliable sensing, feature extraction, and on-device inference under tight memory and latency constraints.",
      achievements: [
        "End-to-end pipeline: data acquisition → preprocessing → model training → MCU deployment",
        "Designed for low-power, real-time inference on resource-constrained hardware",
        "Validated fault detection performance using experimental motor datasets"
      ],
      images: [
        "https://lh3.googleusercontent.com/d/1MfwEhqXcGkv8yoKspk1zGndGX3oHRNQN",
        "https://lh3.googleusercontent.com/d/1lb3tzChgy2Bol8a9JjJoYYjopf_qin64",
        "https://lh3.googleusercontent.com/d/1vztjIjEvnLccaLxv_Fu8H5Sx7Lsh01E2",
        "https://lh3.googleusercontent.com/d/1eEfWUCyVWYl83sLXorKyXWMe5lDpqyGy",
        "https://lh3.googleusercontent.com/d/1VNlGQscIDSHFnICp2RD41z13uvmdGH20",
        "https://lh3.googleusercontent.com/d/1bzUBspAH-_S2GLodF9FIhI4RoBsC2YrY",
        "https://lh3.googleusercontent.com/d/1wMk0Z6ZLRNjG0cAGuRqb5J7_azQEGr1J"
      ],
      videoUrl: "https://youtu.be/EIakxc4opfQ"
    },
    {
      title: "DataLogger Development Board",
      subtitle: "Custom Microcontroller board for Embedded Systems Data Logging",
      remark: "Completed",
      imageUrl: "https://lh3.googleusercontent.com/d/1ZLJ4FenmNw7xBQ2KcebhDvJ7IKtYkqLz",
      videoUrl: "https://youtu.be/jr4CWijJ-Eg",
      images: [
        "https://lh3.googleusercontent.com/d/1DHiWQ0QCrDt-Ip1dpCJ3VHyci0F2l0mB",
        "https://lh3.googleusercontent.com/d/1ZLJ4FenmNw7xBQ2KcebhDvJ7IKtYkqLz"
      ],
      description: "Designed a compact microcontroller development board optimized for low-power IoT nodes. Features USB-C power, multiple sensor headers, and an onboard LiPo charger.",
      achievements: [
        "Designed for University Embedded System Lab",
        "Now Used in Research Projects by Students",
        "Validated power sequencing and bootloader"
      ]
    },
    {
      title: "RFID Datalogger Device",
      subtitle: "Portable, Battery-Powered RFID Data Logger (In progress)",
      remark: "Firmware Development Ongoing",
      imageUrl: "https://lh3.googleusercontent.com/d/1-7Us-myc8hNuLPDaTPjbiEWB-XVdD4ET",
      images: [
        "https://lh3.googleusercontent.com/d/1auQpELNQ5b7MxcK8QNtPiTgQG-nd0JsT",
        "https://lh3.googleusercontent.com/d/1-7Us-myc8hNuLPDaTPjbiEWB-XVdD4ET",
        "https://lh3.googleusercontent.com/d/1IC8NHOKViZmuQGTWC2pE5LYqefyRKg8b"
      ],
      description: "Building a portable RFID data logger device with robust power management and a user-friendly display UI. Designed for battery-powered field operation, with focus on reliability, usability, and a product-ready form factor.",
      achievements: [
        "Portable form factor with battery-powered operation",
        "Power management features for longer runtime (charging/monitoring/sleep modes)",
        "On-device UI display for status, logging, and configuration",
        "Under process to launch in the market"
      ],
      videoUrl: "https://youtube.com/shorts/HcBPys85VPY?feature=share"
    },
    {
      title: "Mini PCB Drone",
      subtitle: "Design and Development of Drones",
      remark: "Firmware Development Ongoing",
      imageUrl: "https://lh3.googleusercontent.com/d/1ZGET_Cgg8Q7w8fFHS2KSjtu5pL10Ac0n",
      documentationUrl: "https://oshwlab.com/nainaiu.rakhaine/mini-cam-drone",
      images: [
        "https://lh3.googleusercontent.com/d/1boieIj2EkNbFG-5uBFEVUjis1tiTQ8Gz",
        "https://lh3.googleusercontent.com/d/1cqcf1fJZrZwjxElnVRS-_QppL9OGsEGn",
        "https://lh3.googleusercontent.com/d/1J9jYF3o0nD2_hkhAY40zN6QqzVbw2jH2",
      ],
      description: "Built a custom PCB drone around an ESP32-S3 and camera for low-latency video streaming and remote monitoring. Focused on lightweight design, reliable telemetry and low-latency video pipeline.",
      achievements: [
        "Featured as Star Project of the Open Source Hardware Lab (OSHWLAB)",
        "Open-sourced flight controller schematics"
      ]
    },
    {
      title: "AUV (Autonomous Underwater Vehicle)",
      subtitle: "Design of Autonomous Underwater Vehicles",
      remark: "Completed",
      imageUrl: "https://lh3.googleusercontent.com/d/17k_B7jW6sctCruOGskNbcYMYGdAdsqpm",
      documentationUrl: "https://github.com/Ad-Deen/AUV-project-Electrical-stack",
      images: [
        "https://lh3.googleusercontent.com/d/17k_B7jW6sctCruOGskNbcYMYGdAdsqpm",
        "https://lh3.googleusercontent.com/d/1FuWzrOLVWYtVcoJjFEg_Kw4FBJvW3u_G",
        "https://lh3.googleusercontent.com/d/1HlGPrJG3P5sizZBM3YmeaM9inzvVub3h",
        "https://lh3.googleusercontent.com/d/1GUvDSb_55nnX11drmnzO5WQ1tFtm07T5"
      ],
      description: "Designed the embedded control system (custom PCB and firmware) integrating IMU, pressure sensor, and 8 ESC-controlled thrusters for autonomous underwater navigation.",
      achievements: [
        "Selected for the Singapore AUV Challenge (SAUVC 2025), representing Bangladesh among 25+ countries",
        "Designed depth-rated control electronics and integrated acoustic positioning"
      ],
      videoUrl: "https://youtube.com/shorts/epUpgJY6oB0?feature=share",
      contest: "SAUVC 2025",
      otherLinks: [
        "https://github.com/Ad-Deen/AUV-project-mechanical_design",
        "https://github.com/Ad-Deen/AUV-project-Simulation-Stack"
      ]
    },
    {
      title: "Autonomous Electric Vehicle",
      subtitle: "Autonomous Electric Vehicle Development",
      remark: "Completed",
      imageUrl: "https://lh3.googleusercontent.com/d/1k6QtMApX3K8wAaliOeSCscVVR5ehiB6n",
      documentationUrl: "https://github.com/nainaiurk/Automama-EV-Control-Stack",
      videoUrl: "https://www.youtube.com/watch?v=2jCTuZDS7PI",
      images: [
        "https://lh3.googleusercontent.com/d/1k6QtMApX3K8wAaliOeSCscVVR5ehiB6n",
        "https://lh3.googleusercontent.com/d/1vb9D1axroIaMf7q5q0vsZ7SHxYiTHjPD",
        "https://lh3.googleusercontent.com/d/11ygSahfXGVf__1qsVFDAu-_vjGsb6nT5",
        "https://lh3.googleusercontent.com/d/1gQAg6bnJLNEdSI0JBB7AYJUDaEh2s0nf",
      ],
      description: "Led embedded development for AutoMAMA, Bangladesh's first student-built Level-2 autonomous EV; designed ESP32 control PCB and firmware for motor/steering actuation coordinated with Jetson Nano vision processing; architected inter-processor communication protocol; grew team from 3 to 10 members; validated over 50+ test hours.",
      achievements: [
        "Designed ESP32 control PCB and firmware for motor/steering actuation",
        "Architected inter-processor communication protocol with Jetson Nano",
        "Grew team from 3 to 10 members",
        "Validated over 50+ test hours"
      ]
    },
    {
      title: "Line Follower Robot",
      subtitle: "Robotics and Automation",
      remark: "Completed",
      videoUrl: "https://youtube.com/shorts/rPUJ0Eg7dRk?feature=share",
      imageUrl: "https://lh3.googleusercontent.com/d/1El3XLctS9-nG9rraRLEJBJYZ8xDBIKwV",
      documentationUrl: "https://oshwlab.com/nainaiu.rakhaine/lfr_pcb",
      images: [
        "https://lh3.googleusercontent.com/d/1eACAu2jFt6TYSUsXyDWNbV61033YWj1E",
        "https://lh3.googleusercontent.com/d/1m6ch2CtWkzoFo8uAIpdbEsKIUQ6mz65Y",
        "https://lh3.googleusercontent.com/d/1El3XLctS9-nG9rraRLEJBJYZ8xDBIKwV",
        "https://lh3.googleusercontent.com/d/1pUzoBY_iNMhSWWmGliyEzNUFZJOnjkr4",
      ],
      description: "Advanced Line Follower Robot with multi-modal operation, PID-based high-speed line following and maze navigation. Includes an interactive display for on-the-fly mode selection and telemetry.",
      achievements: [
        "Developed high-speed PID control and maze navigation modes",
        "Interactive mode selection UI for runtime tuning"
      ],
      otherLinks: ["https://github.com/nainaiurk/InfiniteBot.git"]
    },
    {
      title: "LoRa Messenger",
      subtitle: "Long Range Communication Project",
      remark: "Completed",
      imageUrl: "https://lh3.googleusercontent.com/d/1ZNiOikXJjXsQHgfMWLwObXjfePd-1bqE",
      documentationUrl: "https://github.com/nainaiurk/LoRa-Messenger",
      images: [
        "https://lh3.googleusercontent.com/d/1ZNiOikXJjXsQHgfMWLwObXjfePd-1bqE"
      ],
      description: "Implemented a secure long-range LoRa messaging device with a custom antenna, reaching nearly 5 km in field trials. Emphasized low cost and long battery life for remote IoT deployments.",
      achievements: [
        "Achieved nearly 5 km range with custom antenna",
        "Low-power firmware achieving 30+ day battery life"
      ],
      videoUrl: "https://youtube.com/shorts/KrtnybYSaJo?feature=share"
    },
    {
      title: "Interactive Display Board",
      subtitle: "ESP32 + P10 Display (MQTT + OTA)",
      remark: "In Market",
      imageUrl: "https://lh3.googleusercontent.com/d/1LMHKhn9_kykl6dnVA2s4hDjtcp72xx6C",
      images: [
        "https://lh3.googleusercontent.com/d/1-p4XnGUPoDS9tEa9_qHmJrlshT7_M026",
        "https://lh3.googleusercontent.com/d/1LMHKhn9_kykl6dnVA2s4hDjtcp72xx6C"
      ],
      description: "Built an interactive display board using a P10 LED matrix and ESP32 firmware (FreeRTOS). Content can be controlled remotely from anywhere via MQTT. A backend database keeps all devices managed together for fleet monitoring and configuration. Includes OTA firmware upgrades for remote updates across deployed devices.",
      achievements: [
        "P10 LED matrix display integration with ESP32 firmware (FreeRTOS)",
        "Remote control and real-time updates via MQTT",
        "Device fleet management backed by a database (all devices kept together)",
        "OTA firmware upgrade support for any deployed device",
        "Already in the market: produced 20+ devices and sold 10+"
      ],
      documentationUrl: "https://drive.google.com/file/d/1Y1rUWQo_pO-cJoCFxbaiRE0e3I870iHl/view?usp=sharing"
    }
  ],
  publications: {
    peerReviewed: [
      {
        title: "A Comparative Analysis of Power Consumption and Security Features in LoRa and LoRaWAN Messaging Devices",
        authors: "N. Rakhaine, I. Ahmed, and T. Islam",
        year: 2024,
        venue: "2024 International Conference on Advances in Electrical & Electronic Engineering (ICAEEE)",
        link: "https://ieeexplore.ieee.org/document/10561782",
        type: "Conference",
        summary: "Profiled the energy and cryptographic trade-offs of long-range IoT messaging platforms, guiding protocol selection for resilient field deployments."
      },
      {
        title: "Development of a Portable Dual-Verification Biometric Attendance System for Real-Time Monitoring",
        authors: "N. Rakhaine, A. Paul, and A. Ahammad",
        year: 2024,
        venue: "International Conference on Machine Intelligence and Emerging Technologies (MIET) – Published in Springer",
        link: "https://link.springer.com/chapter/10.1007/978-981-96-2721-9_41",
        type: "Conference",
        summary: "Implemented fingerprint and facial biometric fusion on an embedded edge device to deliver reliable, privacy-aware attendance tracking."
      },
      {
        title: "A Comprehensive Android App-Based Solution for Automated Attendance and Management in Institutions Using IoT and TinyML",
        authors: "A. Paul, N. Rakhaine, N. J. Ohee, and A. Ahammad",
        year: 2023,
        venue: "2023 International Conference on ICT for Sustainable Development (ICICT4SD)",
        link: "https://ieeexplore.ieee.org/document/10303506",
        type: "Conference",
        summary: "Delivered an end-to-end ESP32-CAM and TinyML attendance pipeline with Flutter-based management tooling for secure, low-cost academic deployments."
      },
      {
        title: "IoT-Driven Smart Workplace Ecosystem with RFID Security and Environmental Monitoring",
        authors: "I. Ahmed, N. Rakhaine, A.-D. Mahbub, B. Halder, M. R. Islam, and S. Mulk",
        year: 2024,
        venue: "2024 IEEE Power, Energy and Innovations Conference (PEEIACON)",
        link: "https://ieeexplore.ieee.org/document/10800453",
        type: "Conference",
        summary: "Architected a secure workplace IoT layer combining RFID access, environmental telemetry, and real-time analytics for industrial-grade monitoring."
      },
      {
        title: "Revolution in Campus Transportation: The Autonomous Electric Vehicle With Smart Features",
        authors: "A. Paul, N. Rakhaine, and A. Ahammad",
        year: 2023,
        venue: "2023 IEEE International Conference on Electrical & Power Systems (ICPS)",
        link: "https://ieeexplore.ieee.org/document/10429029",
        type: "Conference",
        summary: "Engineered embedded control and perception subsystems for Bangladesh's first Level 2 autonomous campus vehicle, advancing smart mobility research."
      },
      {
        title: "A Scalable Modular Architecture for Multimodal Control of an Electric Vehicle Platform",
        authors: "N. Rakhaine",
        year: 2026,
        venue: "ICECTE 2026 IEEE Conference",
        link: "https://icecte.ruet.ac.bd/",
        type: "Conference",
        summary: "Presented a modular control architecture enabling multimodal vehicle operation with flexible sensor integration and real-time actuation.",
        status: "Accepted, Not Published Yet"
      },
      {
        title: "A Scalable Multi-Thruster ROV Platform With Modular Sensing and Low-Latency Control for Underwater Surveillance",
        authors: "N. Rakhaine",
        year: 2026,
        venue: "ICECTE 2026 IEEE Conference",
        link: "https://icecte.ruet.ac.bd/",
        type: "Conference",
        summary: "Designed a remotely operated underwater vehicle platform with distributed thruster control and real-time telemetry for marine surveillance applications.",
        status: "Accepted, Not Published Yet"
      }
    ],
    additional: [
      {
        title: "MLPNN and Ensemble Learning Algorithm for Transmission Line Fault Classification",
        authors: "T. Rahman, T. Hasan, A. Ahammad, I. Ahmed, and N. Rakhaine",
        year: 2024,
        venue: "International Transactions on Electrical Energy Systems (Wiley, Q2 Journal)",
        link: "https://onlinelibrary.wiley.com/doi/10.1155/etep/6114718",
        type: "Journal",
        summary: "Contributed to data collection, simulation, ML training, and writing the article."
      }
    ]
  },
  leadership: [
    {
      title: "President, RoboSUST – Volunteering Robotics Club of University",
      organization: "RoboSUST",
      logo: "assets/images/robosust_logo.jpg",
      titleUrl: "https://drive.google.com/file/d/1gCTBNZSm8fb7HOHJ3zn9KoBJc8fmNhnI/view?usp=sharing",
      period: "Mar 2023 – June 2025",
      location: "SUST, Sylhet",
      highlights: [
        "Led 60+ members to organize 4 national robotics workshops (300+ students, 15 universities), co-hosted SUST Inter-University Robotics Competition (50+ teams), and organized inter-university project showcase competition.",
        "Conducted 2 school outreach workshops teaching robotics to 100+ secondary students across Bangladesh.",
        "Mentored 3 teams to podium finishes including 1st place at Auto Grand Prix Tech Fest 2024."
      ]
    },
    {
      title: "Robotics & PCB Design Trainer",
      organization: "EasyEDA",
      logo: "assets/images/easyeda_logo.png",
      titleUrl: "https://www.facebook.com/share/19ue2ncwcx/?mibextid=wwXIfr",
      period: "Apr 2023 - Sep 2024",
      location: "Bangladesh",
      highlights: [
        "As a certified EasyEDA trainer, trained 200+ students in advanced PCB design through a 3-day national workshop series in collaboration with EasyEDA."
      ]
    },
    {
      title: "Chair of Robotics and Automation Society",
      organization: "IEEE SUST Student Branch",
      logo: "assets/images/ieee.png",
      period: "2024 - 2025",
      location: "SUST, Sylhet",
      titleUrl: "https://www.facebook.com/ieeesust/",
      highlights: [
        "Participated in and organized scientific and technical programs within IEEE SUST Student Branch."
      ]
    }
  ],
  awards: [
    {
      title: "JRC Board Hackathon Winner",
      issuer: "JRC Board · IoT in Industry",
      date: "2023",
      highlights: "Winner (Team Lead), delivered an IoT-enabled energy monitoring system in 24 hours.",
      tags: ["Hackathon", "IoT", "Team Lead"],
      credentialUrl: "https://drive.google.com/file/d/1VQQ0TsFdYC3RF_0D8B1G0jAn9il1F5Vq/view?usp=sharing",
      thumbnailUrl: "https://lh3.googleusercontent.com/d/1VQQ0TsFdYC3RF_0D8B1G0jAn9il1F5Vq",
      fullImageUrl: "https://lh3.googleusercontent.com/d/1p8v8rcele-GdjlaiHHPnLFObI2LM56ub"
    },
    {
      title: "Line Follower Robot Contest",
      issuer: "National Robotics Competition",
      date: "2023",
      highlights: "2nd Runner-Up (Team Lead), advanced line following with maze navigation.",
      tags: ["Robotics", "Competition"],
      credentialUrl: "https://drive.google.com/file/d/1BaESfaLckYSf56R7Tm9bQM6ds1uCZ-cl/view?usp=sharing",
      thumbnailUrl: "https://lh3.googleusercontent.com/d/1VGx1PaYbVE2SbtOX2xAmT1_lNcz-zUGX",
      fullImageUrl: "https://lh3.googleusercontent.com/d/1BaESfaLckYSf56R7Tm9bQM6ds1uCZ-cl"
    },
    {
      title: "Singapore AUV Challenge",
      issuer: "International AUV Competition",
      date: "2024",
      highlights: "International Contest — represented Bangladesh among 25+ countries and 50+ teams.",
      tags: ["AUV", "International", "Bangladesh"],
      credentialUrl: "https://drive.google.com/file/d/1VffpiWSmewAvIgWV2Vii274kquTGDGDL/view?usp=sharing",
      thumbnailUrl: "https://lh3.googleusercontent.com/d/1oorc0d5DPN9cgbz0GB8UPj5ZZArnVSaI",
      fullImageUrl: "https://lh3.googleusercontent.com/d/1VffpiWSmewAvIgWV2Vii274kquTGDGDL"
    },
    {
      title: "AUV Startup Seed Funding",
      issuer: "University Innovation Hub",
      date: "2024",
      highlights: "Secured seed funding to launch an AUV startup, focusing on autonomous marine robotics commercialization.",
      tags: ["Entrepreneurship", "AUV"],
      credentialUrl: "https://drive.google.com/file/d/1VDerRfKn2Lv_-EjJHWTQApeAVrFQueO4/view?usp=sharing",
      thumbnailUrl: "https://lh3.googleusercontent.com/d/1VDerRfKn2Lv_-EjJHWTQApeAVrFQueO4",
      fullImageUrl: "https://lh3.googleusercontent.com/d/1VDerRfKn2Lv_-EjJHWTQApeAVrFQueO4"
    },
    {
      title: "TICI Training Certification",
      issuer: "TICI · A+ Grade",
      date: "2022",
      highlights: "21-day training in Electrical Equipment, Power Systems, and PLC — evaluated with an A+ grade.",
      tags: ["PLC", "Power Systems"],
      credentialUrl: "https://drive.google.com/file/d/1pem2_XwcNrlcdcxXVAJyJXv9a6wMokXP/view?usp=sharing",
      thumbnailUrl: "https://lh3.googleusercontent.com/d/1pem2_XwcNrlcdcxXVAJyJXv9a6wMokXP",
      fullImageUrl: "https://lh3.googleusercontent.com/d/1pem2_XwcNrlcdcxXVAJyJXv9a6wMokXP"
    },
    {
      title: "Ulkasemi IC Design Training",
      issuer: "Ulkasemi",
      date: "2024",
      highlights: "7-day training focused on analog design and IC mask layout best practices.",
      tags: ["Analog Design", "IC Layout"],
      credentialUrl: "https://drive.google.com/file/d/13BA9-XdVSMdbl22rjmcJl898YokNoTim/view?usp=sharing",
      thumbnailUrl: "https://lh3.googleusercontent.com/d/13BA9-XdVSMdbl22rjmcJl898YokNoTim",
      fullImageUrl: "https://lh3.googleusercontent.com/d/13BA9-XdVSMdbl22rjmcJl898YokNoTim"
    },
    {
      title: "Embedded Machine Learning",
      issuer: "Coursera",
      date: "2024",
      highlights: "Coursera Certification - built embedded ML workflows with Edge Impulse and neural networks for microcontrollers.",
      tags: ["Machine Learning", "TinyML"],
      credentialUrl: "https://drive.google.com/file/d/1FlPI5nLz1TGsV6VDjtCB_-xHmlOVqa3b/view?usp=sharing",
      thumbnailUrl: "https://lh3.googleusercontent.com/d/1FlPI5nLz1TGsV6VDjtCB_-xHmlOVqa3b",
      fullImageUrl: "https://lh3.googleusercontent.com/d/1FlPI5nLz1TGsV6VDjtCB_-xHmlOVqa3b"
    },
    {
      title: "EasyEDA Certified Instructor",
      issuer: "EasyEDA",
      date: "2024",
      highlights: "Certified Instructor - recognized for expertise in PCB design and electronics simulation instruction.",
      tags: ["PCB Design", "EDA Tools", "Instructor"],
      credentialUrl: "https://drive.google.com/file/d/1NCk7Grs0titd4fBLpcym99HJIdZSELRT/view?usp=sharing",
      thumbnailUrl: "https://lh3.googleusercontent.com/d/1NCk7Grs0titd4fBLpcym99HJIdZSELRT",
      fullImageUrl: "https://lh3.googleusercontent.com/d/1NCk7Grs0titd4fBLpcym99HJIdZSELRT"
    },
    {
      title: "Mobile App Development(Cross Platform)",
      issuer: "ICT Division, Ministry of Post, Bangladesh",
      date: "2024",
      highlights: "Certified Mobile App Developer - developed cross-platform mobile applications using Flutter framework and managed database using Firebase.",
      tags: ["Flutter", "Cross Platform App", "Android, Web App", "Chat App Project"],
      credentialUrl: "https://drive.google.com/file/d/19FfH9TEQDirdk7zxo9-PeDSwjGMOpKS8/view?usp=sharing",
      thumbnailUrl: "https://lh3.googleusercontent.com/d/19FfH9TEQDirdk7zxo9-PeDSwjGMOpKS8",
      fullImageUrl: "https://lh3.googleusercontent.com/d/19FfH9TEQDirdk7zxo9-PeDSwjGMOpKS8"
    }
  ],
  contact: {
    email: "nainaiu.rakhaine@gmail.com",
    phone: "+8801605544977",
    whatsapp: "+8801859844456",
    wechat: "wxid_57x0nku7hbpn22",
    linkedin: "https://www.linkedin.com/in/nainaiu-rakhaine/",
    location: "Sylhet, Bangladesh"
  }
};
