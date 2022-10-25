// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:mangga/components/profile_drawer.dart';
import 'package:mangga/read_data/decode_address.dart';
import 'package:mangga/screens/search_screen.dart';
import 'package:provider/provider.dart';

import '../model/update_address.dart';

class MapScreen extends StatefulWidget {
  static const String id = 'map_screen';
  final DetailsResult? startPosition;
  final DetailsResult? endPosition;

  const MapScreen({Key? key, this.startPosition, this.endPosition})
      : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;

  late Position currentPosition;
  var geoLocator = Geolocator();

  //function, current location
  void locateCurrentPosition() async {
    //create geo object
    Position x = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    //add latitude longitude data to object & contain in latLng
    LatLng latLng = LatLng(x.latitude, x.longitude);

    //create CamPos object add latLng data
    final CameraPosition _currentLoc = CameraPosition(target: latLng, zoom: 14);

    //add CamPos to Map
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_currentLoc));

    //get placeAddress from DecodeAddress class & contain in address
    String address = await DecodeAddress.searchCoordAddress(x, context);
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Page'),
      ),
      drawer: Container(
        color: Colors.white,
        width: 250,
        child: ProfileDrawer(),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              mapController = controller;

              locateCurrentPosition();
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 5,
                    spreadRadius: 0.5,
                    offset: Offset(0.5, 0.5),
                  )
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SearchScreen.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple,
                              blurRadius: 5,
                              spreadRadius: 0.5,
                              offset: Offset(0.5, 0.5),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 10),
                              Text('Search destination'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.house),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //user: provider dipanggil disini
                            Text(Provider.of<UpdateAddress>(context)
                                    .pickUpLocation
                                    ?.placeName ??
                                "Tambah Home"),
                            Text('Your living home address'),
                          ],
                        )
                      ],
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.deepPurple,
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add office'),
                            Text('Your office address'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
