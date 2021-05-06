import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BirdCounterModel extends ChangeNotifier {
  int _birdsSeen = 0;
  int _latestBird = 0;

  int get birdsSeen {
    return _birdsSeen;
  }

  int get latestBird {
    return _latestBird;
  }

  BirdCounterModel() {
    loadPrefs();
  }

  void loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _birdsSeen = prefs.getInt('birdsSeen') ?? 0;
    _latestBird = prefs.getInt('latestBird') ?? 0;

    notifyListeners();
  }

  void seeBird(int birdIndex) async {
    final prefs = await SharedPreferences.getInstance();

    _birdsSeen++;
    _latestBird = birdIndex;

    await prefs.setInt('birdsSeen', _birdsSeen);
    await prefs.setInt('latestBird', _latestBird);

    notifyListeners();
  }

  void resetBirds() async {
    final prefs = await SharedPreferences.getInstance();

    _birdsSeen = 0;
    _latestBird = 0;

    prefs.remove('birdsSeen');
    prefs.remove('latestBird');

    notifyListeners();
  }
}
