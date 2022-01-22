import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../helpers/location_helper.dart';
import '../pages/map_screen.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPlace;
  LocationInput(this.onSelectPlace);
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  void _showPreview(double lat, double lng) {
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: lat, longitude: lng);

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _getUserCurrentLocation() async {
    try {
      final localData = await Location().getLocation();
      print(localData.latitude);
      print(localData.longitude);
      _showPreview(localData.latitude, localData.longitude);
      widget.onSelectPlace(localData.latitude, localData.longitude);
    } catch (e) {
      return;
    }
  }

  Future<void> _selectOnMap() async {
    final LatLng seletedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(
          isSelecting: true,
        ),
      ),
    );
    if (seletedLocation == null) {
      return;
    }
    print(seletedLocation.latitude);
    // ...
    _showPreview(seletedLocation.latitude, seletedLocation.longitude);
    widget.onSelectPlace(seletedLocation.latitude, seletedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mapPreview(),
        locationButton(context),
      ],
    );
  }

  Row locationButton(BuildContext context) {
    return Row(
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
          onPressed: _selectOnMap,
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
