# 🍽️ Chefio - Recipe Sharing App

**Chefio** is a modern recipe-sharing Flutter app built with ❤️ and countless cups of tea ☕.  
It allows users (Chefs) to discover, upload, and share delicious recipes with a beautiful UI and rich features — all powered by Flutter and modern architecture principles.

---

## ✨ Highlights

- 🔧 **Built with MVVM architecture** using `Cubit` and modular code separation.
- 🧩 **Dependency Injection** with `get_it`.
- 🔐 **Secure Token Caching** via `flutter_secure_storage`.
- 🔁 **Pagination in all scrollable views** for smooth data loading.
- 🌍 **Deep Linking** for profiles & recipes (open from shared links).
- 🌐 **Localization** with `easy_localization`.
- 🎨 **Theming with persistence** using `hydrated_cubit`.
- 🔔 **Push notifications** integrated with Firebase.
- ♻️ **Reusable OTP system** following the Open/Closed Principle.
- 📦 **Scalable folder structure** with clean feature modules.

---

## 🧩 Features

### 🏠 Home
- View all or category-filtered recipes
- Search icon in AppBar
- Recipe grid with:
  - Image, name, duration, category
  - Chef name & avatar
  - Like button

### 🔍 Search
- Type to search for recipes by name in real-time

### 📖 Recipe Details
- Large image header with context-specific buttons:
  - Share (if not owner)
  - Popup menu: Edit, Share, Delete (if owner)
- Recipe info: name, duration, description, chef, likes
- View likers
- Ingredients list
- Step-by-step instructions

### ⬆️ Upload Recipe
- Add image, name, description, duration, and category
- Add steps and ingredients on next screen
- Success dialog after upload

### ✏️ Edit Recipe
- Same interface as Upload with pre-filled data

### 👤 Edit Profile
- Update name, bio, and profile picture
- Save changes with visual feedback

### 🔐 Authentication
- Sign up, Login, Forgot password
- OTP verification via email for sign-up and reset

### 🔢 OTP (Reusable)
- OTP feature uses a flexible `OtpReason` interface
- Open/Closed Principle for easy extensibility

### 👤 Profile
- My Profile and Other Chef profiles (separate Cubits)
- Stats: recipes, followers, following
- Follow/unfollow chefs
- Tabs for uploaded and liked recipes
- Followers bottom sheet

### 🔔 Notifications
- Three types of push notifications:
  - 💖 Liked your recipe
  - ➕ Now following you
  - 🆕 Uploaded a new recipe
- View screen for received notifications

### 🧭 Deep Linking
- Shareable links for recipes and profiles (open in-app)

### 🎨 Theming & 🌐 Localization
- Light/Dark mode with `HydratedCubit`
- Multi-language support with `easy_localization`

### 🚀 Onboarding
- Single-screen onboarding with stylish plate design

### ⚙️ Settings
- Switch theme and language
- Accessible from profile screen


## 🛠️ Tech Stack

| Purpose               | Tech Used                          |
|-----------------------|------------------------------------|
| Architecture          | MVVM                               |
| State Management      | Bloc - Cubit                       |
| Networking            | Dio                                |
| Routing               | GoRouter                           |
| Dependency Injection  | get_it                             |
| Secure Storage        | flutter_secure_storage             |
| Caching               | shared_preferences                 |
| Theming               | hydrated_cubit                     |
| Localization          | easy_localization                  |
| Notifications         | Firebase Cloud Messaging           |

---

## 🤝 Collaboration & Development Effort

Chefio was built in close collaboration with a backend engineer, who developed a powerful RESTful API and supported Firebase messaging.

On the client side, I:
- Architected the entire app using MVVM and clean feature modules.
- Built robust Cubits and reusable logic across features.
- Integrated REST APIs using Dio with error handling.
- Handled all UI design, theming, and localization.
- Implemented Firebase push notifications and deep linking.
- Secure token handling
- Focused on scalability, reusability, and clean, testable code.

---

## 📡 Backend

- RESTful API developed by backend teammate.
- Firebase for push notifications.

---

## 💌 Final Words

Chefio took weeks of hard work, attention to detail, and late-night debugging sessions (powered by tea ☕).

If you find this project useful, inspiring, or impressive — a ⭐ would mean a lot!

> Made with Flutter, clean architecture, and passion 💙

---

