import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:mangga/components/input_loc.dart';
import 'package:provider/provider.dart';

import '../model/update_address.dart';

class SearchScreen extends StatefulWidget {
  static const String id = 'search_screen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _pickLoc = TextEditingController();
  final TextEditingController _dropLoc = TextEditingController();
  //-------------------------------------------------------------
  Timer? _debounce;

  DetailsResult? startPosition;
  DetailsResult? endPosition;

  late FocusNode startFocusNode;
  late FocusNode endFocusNode;

  GooglePlace googlePlace =
      GooglePlace('AIzaSyCpuxxqFQrsMohkLMa30tJAsc_59sQP-dg');

  //List tempat yg cocok
  List<AutocompletePrediction> predictions = [];

  autoCompleteSearh(String value) async {
    var result = await googlePlace.autocomplete.get(value);

    //predictions = list tempat yg cocok dari api, state mounted
    if (result != null && result.predictions != null && mounted) {
      print(result.predictions!.first.description);
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    startFocusNode.dispose();
    endFocusNode.dispose();
  }
  //-------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    String pickAddress =
        Provider.of<UpdateAddress>(context).pickUpLocation?.placeName ??
            "Karangmalang";
    _pickLoc.text = pickAddress;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: const Text('Manage Location'),
      ),
      body: Column(
        children: [
          Container(
            height: 135,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  spreadRadius: 0.5,
                  offset: Offset(0.5, 0.5),
                )
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                InputLoc(
                  focusNode: startFocusNode,
                  controller: _pickLoc,
                  text: 'Pick Up Location',
                  suffixIcon: _pickLoc.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              predictions = [];
                              _pickLoc.clear(); //menghilangkan text di x
                            });
                          },
                          icon: Icon(Icons.clear_outlined),
                        )
                      : null,
                  onChanged: (value) {
                    //jika debaounce aktif & mau ketik lagi, harus cancel
                    if (_debounce?.isActive ?? false) _debounce!.cancel();
                    _debounce = Timer(const Duration(milliseconds: 1000), () {
                      if (value.isNotEmpty) {
                        autoCompleteSearh(value);
                      } else {
                        predictions = [];
                        startPosition = null;
                      }
                    });
                  },
                ),
                const SizedBox(height: 10),
                InputLoc(
                  focusNode: endFocusNode,
                  controller: _dropLoc,
                  text: 'Drop Location',
                  suffixIcon: _dropLoc.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              predictions = [];
                              _dropLoc.clear(); //menghilangkan text di x
                            });
                          },
                          icon: Icon(Icons.clear_outlined),
                        )
                      : null,
                  onChanged: (value) {
                    //jika debaounce aktif & mau ketik lagi, harus cancel
                    if (_debounce?.isActive ?? false) _debounce!.cancel();
                    _debounce = Timer(const Duration(milliseconds: 1000), () {
                      if (value.isNotEmpty) {
                        autoCompleteSearh(value);
                      } else {
                        predictions = [];
                        endPosition = null;
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: predictions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  predictions[index].description.toString(),
                ),
                //memilih tempat
                onTap: () async {
                  final placeID = predictions[index].placeId!;
                  //detail dari placeID
                  final details = await googlePlace.details.get(placeID);
                  if (details != null && details.result != null && mounted) {
                    //detect which textfield is selected
                    if (startFocusNode.hasFocus) {
                      setState(() {
                        startPosition = details.result;
                        //only use the name without detail
                        _pickLoc.text = details.result!.name!;
                        //utk menghilangkan list d bawah input setelah di click
                        predictions = [];
                      });
                    } else {
                      setState(() {
                        endPosition = details.result;
                        _dropLoc.text = details.result!.name!;
                        predictions = [];
                      });
                    }
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
