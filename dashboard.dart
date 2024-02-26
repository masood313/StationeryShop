import 'dart:io';
import 'user.dart';

class Dashboard {
  static List<String> stationeries = [];

  static void addStationeryItem(User user) {
    print("Enter Stationery Item:");
    String stationeryItem = stdin.readLineSync()!;
    user.profile.stationeries.add(stationeryItem);
    print("Stationery Item added successfully!");
  }

  static void displayStationeryItems(User user) {
    print("Stationery:");
    for (var stationery in user.profile.stationeries) {
      print(stationery);
    }
  }

  static void modifyStationeryItem(User user) {
    print("Enter Stationery Item to modify:");
    String stationeryItem = stdin.readLineSync()!;

    if (user.profile.stationeries.contains(stationeryItem)) {
      print("Enter new Stationery Item:");
      String newStationeryItem = stdin.readLineSync()!;

      int index = user.profile.stationeries.indexOf(stationeryItem);
      user.profile.stationeries[index] = newStationeryItem;

      print("Stationery Item modified successfully!");
    } else {
      print("Stationery Item not found!");
    }
  }

  static void deleteStationeryItem(User user) {
    print("Enter Stationery Item to delete:");
    String stationeryItem = stdin.readLineSync()!;

    if (user.profile.stationeries.contains(stationeryItem)) {
      user.profile.stationeries.remove(stationeryItem);
      print("Stationery Item deleted successfully!");
    } else {
      print("Stationery Item not found!");
    }
  }
}
