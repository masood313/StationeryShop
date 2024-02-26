import 'dart:io';
import 'user.dart';
import 'profile.dart';
import 'dashboard.dart';

void main() {
  int choice;
  bool isLoggedIn = false;
  User? user;

  while (true) {
    print("--------------------------------");
    print("--------------------------------");
    print("--------------------------------");
    print('Welcome to the Stationery Shop!');
    print("--------------------------------");
    print("--------------------------------");
    print("1. Login");
    print("2. Signup");
    print("3. Exit");
    print("Enter your choice:");
    choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        isLoggedIn = User.login();
        if (isLoggedIn) {
          user = User.currentUser!;
          print("Login successful!");
        } else {
          print("Login failed. Try again.");
        }
        break;
      case 2:
        User.signup();
        break;
      case 3:
        exit(0);
    }

    if (isLoggedIn) {
      while (true) {
        print("1. Show User Profile");
        print("2. Add Stationery");
        print("3. Modify Stationery");
        print("4. Show Stationery");
        print("5. Delete Stationery");
        print("6. Logout");
        print("Enter your choice:");
        choice = int.parse(stdin.readLineSync()!);

        switch (choice) {
          case 1:
            if (user != null) {
              Profile.showProfile(user);
            }
            break;
          case 2:
            if (user != null) {
              Dashboard.addStationeryItem(user);
            }
            break;
          case 3:
            if (user != null) {
              Dashboard.modifyStationeryItem(user);
            }
            break;
          case 4:
            if (user != null) {
              Dashboard.displayStationeryItems(user);
            }
            break;
          case 5:
            if (user != null) {
              Dashboard.deleteStationeryItem(user);
            }
            break;
          case 6:
            isLoggedIn = false;
            user = null;
            print("Logged out successfully.");
            break;
        }

        if (!isLoggedIn) {
          break;
        }
      }
    }
  }
}
