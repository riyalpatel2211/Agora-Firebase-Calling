# 📱 Flutter Real-Time Calling App (Firebase + Agora + GetX)

A real-time communication mobile application built with **Flutter**, **Firebase**, **Agora**, and **GetX**.  
The app provides audio/video calling, a coin-based billing system, real-time user presence, and a managed wallet for each user.

---

## 🔐 Authentication & User Onboarding
The app uses **Firebase Authentication** to handle secure login and signup with email/password.

### Highlights
- Secure email-based registration & login
- Automatic session handling by Firebase
- **Signup Reward:** Every new user receives **500 coins** added to their wallet
- Wallet balance stored and synced via **Cloud Firestore**

---

## 👥 User Management
A dedicated admin/user list panel powered by Firestore queries.

### Features
- Paginated list of all registered users
- Displays:
    - Username
    - Email
    - Current wallet balance
    - Online/offline presence
- Real-time updates through Firebase listeners

---

## 🔄 Realtime System (Firebase)
Firebase Realtime Database / Firestore is used to maintain call-related live data.

Used for:
- Call room creation and status tracking
- Live user availability
- Real-time call timer updates
- Broadcasting when a new room is online

---

## 🎥 Audio & Video Calling (Agora)
The app integrates **Agora RTC** to provide high-quality voice and video communication.

### Supported Actions
- Start video calls
- Start audio calls
- Call a specific user by ID
- Join/leave rooms dynamically
- Real-time call state monitoring

---

## 💰 Coin Billing System
Calls deduct coins from the user based on duration.

| Call Type    | Price Per Minute |
|--------------|------------------|
| Video Call   | 10 coins         |
| Audio Call   | 5 coins          |

### Billing Flow
1. Timer begins when the call starts
2. Coins deducted once per minute
3. If balance reaches zero:
    - Call ends immediately
    - Both users receive an alert
4. Wallet updates sync instantly via Firestore

---

## ⭐ Additional/Optional Features
- Push notifications with Firebase Cloud Messaging
- Daily reward system
- User block/report
- Call history and filters (date/duration/user)

---

## 🧩 State Management — **GetX**
The entire application flow is powered by **GetX**, including:

- Authentication controller
- User list controller
- Wallet controller (live Firestore updates)
- Call controller (Agora + timers)
- Real-time event observers

GetX ensures reactive UI updates and clean separation of logic.

---

## 🛠️ Tech Stack

### Frontend
- Flutter (Dart)
- GetX (state management)
- Firebase SDK
- Agora RTC SDK

### Backend / Services
- Firebase Authentication
- Firebase Firestore / Realtime Database
- Firebase Cloud Messaging

---

## 🎯 Final Outcome
By the end of development, the app offers:

- A functional real-time audio/video calling system
- Secure user login with auto signup bonus
- Live wallet updates and automated billing
- Online/offline user tracking
- Push notification–ready structure

---

## 📄 License
Add your license information here.

---

## 🙏 Thanks for checking out the project!
For additional documentation, architecture diagrams, or folder structure — just let me know!
