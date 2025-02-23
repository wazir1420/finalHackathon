import 'package:stacked/stacked.dart';

class OrderDetailViewModel extends BaseViewModel {
  int _quantity = 1;
  int get quantity => _quantity;

  double get unitPrice => 15.0;

  double get subTotal => _quantity * unitPrice;
  double get deliveryCharge => 10.0;
  double get discount => 10.0;
  double get total => subTotal + deliveryCharge - discount;

  void incrementQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (_quantity > 1) {
      _quantity--;
      notifyListeners();
    }
  }
}
