import 'package:flutter/cupertino.dart';
import 'package:mangga/model/address.dart';

class UpdateAddress extends ChangeNotifier {
  Address? pickUpLocation;

  void updatePickUpLocationAddress(Address pickUpAddress) {
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }
}
