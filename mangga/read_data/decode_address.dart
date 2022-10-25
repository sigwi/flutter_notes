import 'package:geolocator/geolocator.dart';
import 'package:mangga/model/address.dart';
import 'package:mangga/model/update_address.dart';
import 'package:mangga/read_data/decode_api.dart';
import 'package:provider/provider.dart';

class DecodeAddress {
  static Future<String> searchCoordAddress(Position x, context) async {
    String placeAddress = '';

    String api =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${x.latitude},${x.longitude}&key=AIzaSyCpuxxqFQrsMohkLMa30tJAsc_59sQP-dg';
    String st1, st2, st3, st4;

    //contain decode api to response
    var response = await DecodeApi.getData(api);

    //memilih data json yg dipakai
    if (response == 200) {
      st1 = response['results'][0]['address_components'][0]['long_name'];
      st2 = response['results'][0]['address_components'][1]['long_name'];
      st3 = response['results'][0]['address_components'][5]['long_name'];
      st4 = response['results'][0]['address_components'][6]['long_name'];
      placeAddress = st1 + st2 + st3 + st4;

      //mengisi objek dari address dengan data decode api
      Address userPickUpLoc = Address();
      userPickUpLoc.latitude = x.latitude;
      userPickUpLoc.longitude = x.longitude;
      userPickUpLoc.placeName = placeAddress;

      //triger method dari update_address dan add data dari userPickUpLocation
      Provider.of<UpdateAddress>(context, listen: false)
          .updatePickUpLocationAddress(userPickUpLoc);
    }
    return placeAddress;
  }
}
