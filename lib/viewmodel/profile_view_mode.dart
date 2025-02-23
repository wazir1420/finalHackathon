import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  bool isToggleOn = false;

  void toggleSwitch() {
    isToggleOn = !isToggleOn;
    rebuildUi();
  }
}
