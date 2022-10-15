# TCAExample

This app is built on top of SwiftUI and Compsable Architecture new RedeucerProtocol API.

Feature:
- Onboarding flow
- Home Screen
- Welcome Screen
- App Storage


Flow: 
Root:
- Switch Store that handles the flow based on isUserLogged in status.
- Home screen that displays the user first and last name with a logout button that toggle the Switch store status
- On boarding flow that inclues, T&Cs, Credentials, Personal details, Pin and Confirm Pin.
- @Appstorage for user info and logged in status.
