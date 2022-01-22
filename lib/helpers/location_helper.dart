// const GOOGLE_API_KEY = 'AIzaSyDZ1HsNmYitBuUcwcFO4OcFXGGeQif6icM'; // Sadiq Key
const GOOGLE_API_KEY = 'AIzaSyAObMzoszg93PuKpMW5JpUjbN4H9JC0isY'; // My Key

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x400&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double long) async {
    
  }
}
