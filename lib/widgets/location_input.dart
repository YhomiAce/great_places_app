import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../helpers/location_helper.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;
  Future<void> _getUserCurrentLocation() async {
    setState(() {
      _previewImageUrl = null;
    });
    final localData = await Location().getLocation();
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: localData.latitude, longitude: localData.longitude);
    print(localData.latitude);
    print(localData.longitude);
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mapPreview(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _getUserCurrentLocation,
            ),
            FlatButton.icon(
              icon: Icon(Icons.map),
              label: Text('Select on Map'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Container mapPreview() {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
        ),
        height: 170,
        width: double.infinity,
        child: _previewImageUrl == null
            ? Text(
                'No Location Chosen',
                textAlign: TextAlign.center,
              )
            : Image.network(
                _previewImageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
      );
  }
}
