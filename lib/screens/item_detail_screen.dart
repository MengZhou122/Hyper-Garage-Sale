import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ItemDetailScreen extends StatelessWidget {
  final Map<String, dynamic> infoList;
  GoogleMapController _controller;

  ItemDetailScreen({this.infoList});

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId('home'),
        position: LatLng(37.42796133580664, -122.085749655962),
        icon: BitmapDescriptor.defaultMarker,
      )
    ].toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items Info'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(infoList['user']),
            Text(infoList['title']),
            Text(infoList['price']),
            Text(infoList['description']),
            Text(infoList['address']),
            Text(infoList['longitude']),
            Text(infoList['latitude']),
            Container(
                height: 200,
                width: 300,
                child: Image.network(infoList['picture0'])),
            Text(infoList['picture1']),
            Text(infoList['picture2']),
            Text(infoList['picture3']),
          ],
        ),
      ),
    );
  }

  Widget mapWidget() {
    return GoogleMap(
      mapType: MapType.normal,
      markers: _createMarker(),
      initialCameraPosition:
          CameraPosition(target: LatLng(22.5763, 88.3694), zoom: 12.0),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
    );
  }
}
