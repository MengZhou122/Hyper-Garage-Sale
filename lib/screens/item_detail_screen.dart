import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hypergaragesale/components/text_pair_box.dart';

class ItemDetailScreen extends StatelessWidget {
  final Map<String, dynamic> infoList;

  ItemDetailScreen({this.infoList});

  List<Widget> getPictures() {
    List<Widget> pictures = [];
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextPairBox(title: ' Owner', content: infoList['user']),

              Row(
                children: <Widget>[
                  TextPairBox(title: ' Title', content: infoList['title']),
                  SizedBox(width: 15.0),
                  TextPairBox(
                      title: ' Price', content: '\$ ${infoList['price']}'),
                ],
              ),
              TextPairBox(
                  title: ' Description', content: infoList['description']),
              TextPairBox(title: ' Address', content: infoList['address']),
              SizedBox(height: 5.0),
              Text(infoList['picture0']),
              Text('${infoList['picture1']} and this is 2nd picture'),
              //Text('${infoList['picture3']}!!!!!'),
              Container(
                height: infoList['picture0'] == ' ' ? 0 : 180,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      infoList['picture0'] == ' '
                          ? null
                          : SmallPicture(
                              tag: 'picture0',
                              imagePath: infoList['picture0'],
                            ),
                      SizedBox(width: 5.0),
                      infoList['picture0'] == ' '
                          ? null
                          : SmallPicture(
                              tag: 'picture1',
                              imagePath: infoList['picture0'],
                            ),
                    ]),
              ),
              SizedBox(height: 7.0),
              Container(height: 220, child: mapWidget()),
            ],
          ),
        ),
      ),
    );
  }

  Widget mapWidget() {
    GoogleMapController _controller;
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
          CameraPosition(target: LatLng(_latitude, _longitude), zoom: 11.0),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
    );
  }
}

class SmallPicture extends StatelessWidget {
  final String tag;
  final String imagePath;

  SmallPicture({@required this.tag, @required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullPicture(tag: tag, imagePath: imagePath),
          ),
        );
      },
      child: Hero(
        tag: tag,
        child: Container(height: 180, child: Image.network(imagePath)),
      ),
    );
  }
}

class FullPicture extends StatelessWidget {
  final String tag;
  final String imagePath;

  FullPicture({@required this.tag, @required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Center(
          child: Hero(
            tag: 'picture0',
            child: Image.network(imagePath),
          ),
        ),
      ),
    );
  }
}
