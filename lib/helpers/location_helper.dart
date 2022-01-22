import 'dart:convert';
import 'package:http/http.dart' as http;

// const GOOGLE_API_KEY = 'AIzaSyDZ1HsNmYitBuUcwcFO4OcFXGGeQif6icM'; // Sadiq Key
const GOOGLE_API_KEY = 'AIzaSyAObMzoszg93PuKpMW5JpUjbN4H9JC0isY'; // My Key

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x400&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double long) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&amp;key=$GOOGLE_API_KEY');
    try {
      final response = await http.get(url);
      print(jsonDecode(response.body));
      final result =
          json.decode(response.body)['results'][0]['formatted_address'];
      print(result);
      return result;
    } catch (error) {
      print(error);
    }
  }
}
