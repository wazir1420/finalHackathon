import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  int _currentPage = 0;
  int _selectedIndex = 0; // For bottom navigation

  int get currentPage => _currentPage;
  int get selectedIndex => _selectedIndex;

  HomeViewModel() {
    _startAutoPageChange();
  }

  void _startAutoPageChange() {
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (pageController.hasClients) {
        if (_currentPage < 2) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  void setCurrentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
