import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hypergaragesale/components/text_pair_box.dart';

class ItemDetailScreen extends StatelessWidget {
  final Map<String, dynamic> infoList;
  GoogleMapController _controller;

  ItemDetailScreen({this.infoList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items Info'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextPairBox(title: ' Owner', content: infoList['user']),
              Row(
                children: <Widget>[
                  TextPairBox(title: ' Title', content: infoList['title']),
                  SizedBox(
                    width: 10.0,
                  ),
                  TextPairBox(
                      title: ' Price', content: '\$ ${infoList['price']}'),
                ],
              ),
              TextPairBox(
                  title: ' Description', content: infoList['description']),
              TextPairBox(title: ' Address', content: infoList['address']),
              Text(infoList['picture0']),
              Text(infoList['picture1']),
              Text(infoList['picture2']),
              Text('${infoList['picture3']}!!!!!'),
              Container(
                  height: 100,
                  width: 100,
                  child: Image.network(infoList['picture0'])),
              Container(height: 200, child: mapWidget()),
            ],
          ),
        ),
      ),
    );
  }

  Widget mapWidget() {
    double _latitude = double.parse(infoList['latitude']);
    double _longitude = double.parse(infoList['longitude']);

    Set<Marker> _createMarker() {
      return <Marker>[
        Marker(
          markerId: MarkerId('Home'),
          position: LatLng(_latitude, _longitude),
          icon: BitmapDescriptor.defaultMarker,
        )
      ].toSet();
    }

    return GoogleMap(
      mapType: MapType.normal,
      markers: _createMarker(),
      initialCameraPosition:
          CameraPosition(target: LatLng(_latitude, _longitude), zoom: 12.0),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
    );
  }
}
