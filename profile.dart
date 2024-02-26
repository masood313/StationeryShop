import 'user.dart';
import 'dart:io';

class Profile {
  String name;
  int age;
  String email;
  String mobileNumber;
  String address;
  List<String> stationeries;

  Profile(this.name, this.age, this.email, this.mobileNumber, this.address,
      this.stationeries);

  static Profile createProfile() {
    String name;
    do {
      print("Enter name (minimum 2 characters):");
      name = stdin.readLineSync()!;
    } while (name.length < 2);

    int age;
    do {
      print("Enter age (minimum 18 years):");
      age = int.parse(stdin.readLineSync()!);
    } while (age < 18);

    String email;
    do {
      print("Enter email (e.g., sample@gmail.com):");
      email = stdin.readLineSync()!;
    } while (!isValidEmail(email));

    String mobileNumber;
    do {
      print("Enter mobile number:");
      mobileNumber = stdin.readLineSync()!;
    } while (!isValidMobileNumber(mobileNumber));

    String address;
    do {
      print("Enter address:");
      address = stdin.readLineSync()!;
    } while (address.isEmpty);

    return Profile(name, age, email, mobileNumber, address, []);
  }

  static bool isValidMobileNumber(String number) {
    RegExp regex = RegExp(r'^[0-9]{11}$');
    return regex.hasMatch(number);
  }

  static bool isValidEmail(String email) {
    RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  static void showProfile(User user) {
    print("Name: ${user.profile.name}");
    print("Age: ${user.profile.age}");
    print("Email: ${user.profile.email}");
    print("Mobile Number: ${user.profile.mobileNumber}");
    print("Address: ${user.profile.address}");
  }
}
