import 'package:running_trainer/Utils/storage.dart';
import 'package:running_trainer/Utils/keys.dart';

class User {
  static init() {
  }

  /// Sets the time aim of the user in minutes
  static void setWeekTimeAim(int aim) {
    Storage.setInt(Keys.weekAimTime, aim);
  }

  /// Sets the distance aim of the user in km
  static void setWeekDistanceAim(int aim) {
    Storage.setInt(Keys.weekAimDistance, aim);
  }

  /// Return the time aim of the user in minutes
  static int getWeekTimeAim() {
    return Storage.getInt(Keys.weekAimTime, defaultValue: 50);
  }

  /// Returns the distance aim of the user in km
  static int getWeekDistanceAim() {
    return Storage.getInt(Keys.weekAimDistance, defaultValue: 20);
  }

    /// Sets the time aim of the user in minutes
  static void setMonthTimeAim(int aim) {
    Storage.setInt(Keys.monthAimTime, aim);
  }

  /// Sets the distance aim of the user in km
  static void setMonthDistanceAim(int aim) {
    Storage.setInt(Keys.monthAimDistance, aim);
  }

  /// Return the time aim of the user in minutes
  static int getMonthTimeAim() {
    return Storage.getInt(Keys.monthAimTime, defaultValue: 50);
  }

  /// Returns the distance aim of the user in km
  static int getMonthDistanceAim() {
    return Storage.getInt(Keys.monthAimDistance, defaultValue: 20);
  }

}