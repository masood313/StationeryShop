import 'dart:io';
import 'profile.dart';

class User {
  static List<User> _users = [];
  static User? currentUser;

  String username;
  String password;
  Profile profile;

  User(this.username, this.password, this.profile);

  static bool login() {
    print("Enter username:");
    String username = stdin.readLineSync()!;
    print("Enter password:");
    String password = stdin.readLineSync()!;

    for (var user in _users) {
      if (user.username == username && user.password == password) {
        currentUser = user;
        return true;
      }
    }
    return false;
  }

  static void signup() {
    String username;
    do {
      print("Enter username (minimum 2 characters):");
      username = stdin.readLineSync()!;
    } while (username.length < 2);

    String password;
    do {
      print("Enter password (minimum 4 characters):");
      password = stdin.readLineSync()!;
    } while (password.length < 4);

    Profile profile = Profile.createProfile();
    _users.add(User(username, password, profile));
    print("Signup successful!");
  }
}
