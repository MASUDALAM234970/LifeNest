<div align="center">

# 🪺 LifeNest
### *A Safe Space for Your Mind*

**Mental Wellness & Suicide Prevention Mobile Application**

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![TensorFlow Lite](https://img.shields.io/badge/TFLite-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

</div>

---

## 📖 What is LifeNest?

**LifeNest** is a mobile application built with **Flutter** that helps people deal with **loneliness, depression, and mental health challenges** — while actively supporting **suicide prevention**.

It gives users a private, safe digital space to:
- Track how they feel every day
- Practice mindfulness and relaxation exercises
- Access crisis support instantly when needed
- Learn about mental health in a stigma-free way

> Think of it as a mental health companion that fits in your pocket — always available, always private.

---

## 🎯 Why This Project?

Mental health is one of the biggest challenges of our time — yet most people have no easy way to get help. LifeNest addresses this by:

| Problem | LifeNest Solution |
|---|---|
| No access to mental health tools | Free, always-on mobile app |
| Stigma around seeking help | Anonymous mode, private journaling |
| Crisis with no one to call | One-tap SOS button + helplines |
| No awareness of mental health | In-app educational resources |
| Loneliness and isolation | Guided wellness routines + motivational content |

---

## ✨ Core Features

### 📓 Mood Tracking & Journaling
Log your daily emotions with emojis or text. See weekly trend charts to understand your emotional patterns over time.

### 🌬️ Guided Breathing & Meditation
Animated breathing exercises and audio-guided meditation sessions to calm anxiety and reduce stress in real time.

### 💬 Motivational Quotes & Stories
A daily feed of uplifting content to keep you connected to positivity and remind you that you're not alone.

### 🆘 Crisis Support (SOS)
- One-tap **SOS button** on the home screen
- Local **helpline directory**
- Personal **safety plan builder**
- AI **chatbot** for immediate first-response guidance

### 📚 Mental Health Resources
Evidence-based articles, coping-skill guides, and self-care tips — searchable and personalised.

### 🤖 AI Features *(Optional)*
- **Mood Prediction** — predicts emotional trends from your history
- **Sentiment Analysis** — analyses journal text to surface hidden patterns
- **Personalised Recommendations** — suggests content based on your mood

> All AI runs **on-device** via TensorFlow Lite — your data never leaves your phone.

---

## 🗺️ App Screens

```
LifeNest
├── 1. Onboarding       → Mood check-in, notification setup, privacy consent
├── 2. Home             → Mood tracker, motivational quote, SOS button
├── 3. Mood Journal     → Emoji/text entry, weekly trend chart
├── 4. Relax & Wellness → Breathing, meditation audio, journaling prompts
├── 5. Crisis Support   → Helplines, safety plan, AI chatbot
└── 6. Resources        → Mental health articles, tips, guides
```

---

## 🏗️ Tech Stack & Architecture

### Frontend
- **Framework:** Flutter (single codebase for Android & iOS)
- **State Management:** BLoC / Riverpod
- **Design:** Clean, minimal UI with calming mental-health-friendly colors

### Backend
| Service | Purpose |
|---|---|
| Firebase Auth | Secure user authentication |
| Firestore | Mood logs & journal entries |
| Firebase Storage | Audio files & meditation media |
| Remote Config | Dynamic content updates (no re-deploy needed) |

### AI / ML Layer
- **Models:** Mood prediction & sentiment analysis
- **Framework:** TensorFlow Lite (`.tflite`) — runs fully on-device
- **Training Data:**
  - [Kaggle](https://kaggle.com) — Depression & Suicide detection datasets
  - [GoEmotions](https://github.com/google-research/google-research/tree/master/goemotions) — 27 emotion categories
  - [ISEAR](https://www.unige.ch/cisa/research/materials-and-online-research/research-material/isear/) — Emotion recognition dataset

---

## 🎨 Branding

| Element | Value |
|---|---|
| **App Name** | LifeNest |
| **Tagline** | *"A Safe Space for Your Mind"* |
| **Logo Concept** | A nest with a small bird or light, symbolising safety and hope |
| 🔵 **Soft Blue** | `#6CA0DC` — Calmness |
| 🟡 **Warm Yellow** | `#FFD166` — Hope & Positivity |
| ⚪ **White** | `#FFFFFF` — Purity & Safety |

---

## 🔒 Privacy & Data Security

LifeNest is built with **privacy-first** principles:

- ✅ End-to-end encryption on all user data
- ✅ **Anonymous mode** — use the app without any personal data stored
- ✅ AI models run **locally on-device** — no mood or journal data sent to external servers
- ✅ Only **public research datasets** used for AI training — no clinical data stored
- ✅ Research insights use **anonymised, aggregated data only**

---

## 📊 Expected Impact

- 🧠 Improved mental wellness and emotional self-awareness among users
- 🤝 Reduced feelings of loneliness and depression
- 📢 Increased public awareness and reduced stigma around mental health
- 🚨 Crisis intervention reaching high-risk individuals before escalation
- 🔬 Anonymised mental health trend data useful for academic research

---

## 🚀 Getting Started

```bash
# Clone the repository
git clone https://github.com/your-username/lifenest.git

# Navigate into the project
cd lifenest

# Install dependencies
flutter pub get

# Run the app
flutter run
```

> **Requirements:** Flutter SDK, Dart, Firebase project setup (see `/docs/firebase-setup.md`)

---

## 📁 Project Structure

```
lifenest/
├── lib/
│   ├── features/
│   │   ├── mood_tracker/
│   │   ├── journal/
│   │   ├── wellness/
│   │   ├── crisis_support/
│   │   └── resources/
│   ├── core/
│   │   ├── theme/
│   │   ├── services/
│   │   └── models/
│   └── main.dart
├── assets/
│   ├── audio/          # Meditation & breathing audio
│   └── models/         # TFLite model files
└── pubspec.yaml
```

---

## 🎓 About This Project

This app was developed as a **Final Year Project** focused on combining technology, psychology, and social responsibility to tackle mental health challenges.

**Framework:** Flutter | **University Project** | **2025**

---

<div align="center">

*LifeNest — Because your mind deserves a safe place to rest.*

</div>
