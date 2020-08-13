import 'package:coffee_shop_app/coffee_hub/constants/colors.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/repositories/cart_client.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController textEditingController = TextEditingController();

  GoogleMapController mapController;
  onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> markers = {};
  LatLng currentLocation;
  getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition();
      currentLocation = LatLng(position.latitude, position.longitude);
      mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: currentLocation, zoom: 15)));
      markers.add(Marker(markerId: MarkerId('1'), position: currentLocation));
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: markers,
        onTap: (argument) {
          // showDialog(
          //     context: context,
          //     builder: (_) => new AlertDialog(
          //           backgroundColor: backGroundColor,
          //           title: Text(
          //             "Position",
          //             style: GoogleFonts.oswald(),
          //           ),
          //           content: Form(
          //             key: formKey,
          //             child: Column(
          //               mainAxisSize: MainAxisSize.min,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: <Widget>[
          //                 TextFormField(
          //                   style: GoogleFonts.oswald(),
          //                   controller: textEditingController,
          //                   validator: (value) {
          //                     if (value.isEmpty) {
          //                       return 'Position Field is required';
          //                     }
          //                   },
          //                   decoration: InputDecoration(
          //                       hintText: 'Enter Position Name ...',
          //                       hintStyle: GoogleFonts.oswald()),
          //                 ),
          //                 SizedBox(
          //                   height: 10,
          //                 ),
          //                 Center(
          //                     child: RaisedButton.icon(
          //                         color: mainColor,
          //                         textColor: Colors.white,
          //                         shape: RoundedRectangleBorder(
          //                             borderRadius: BorderRadius.circular(12)),
          //                         icon: Icon(
          //                           Icons.add,
          //                           size: 14,
          //                         ),
          //                         label: Text(
          //                           'add position',
          //                           style: GoogleFonts.oswald(),
          //                         ),
          //                         onPressed: () {
          //                           if (formKey.currentState.validate()) {
          //                             OrdersClient.ordersClient
          //                                 .addPositionToFirestore(
          //                                     textEditingController.text,
          //                                     argument.latitude,
          //                                     argument.longitude);
          //                             Navigator.pop(context);
          //                           } else {
          //                             return;
          //                           }
          //                         })),
          //               ],
          //             ),
          //           ),
          //         ));
          markers.add(Marker(markerId: MarkerId('1'), position: argument));
          setState(() {});
        },
        onMapCreated: (controller) {
          onMapCreated(controller);
          getCurrentLocation();
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(31.51667, 34.48333),
          zoom: 10.0,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
              foregroundColor: backGroundColor,
              child: Icon(
                Icons.location_on,
                size: 35,
              ),
              backgroundColor: mainColor,
              onPressed: () {
                getCurrentLocation();
              }),
        ],
      ),
    );
  }
}
