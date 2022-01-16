const GOOGLE_API_KEY = 'AIzaSyC9iLh_Dblvix8Pd4dE7HX911Aj7dQGcJI';
const GOOGLE_SIGN = 'B9u-ihi5TbRHEAeYtWAoCBTzeYU=';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=10&size=400x400&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
    // return 'https://maps.googleapis.com/maps/api/staticmap?center=&37.4219983,-122.084&zoom=10&size=400x400&maptype=roadmap&markers=color:red%7Clabel:C%7C37.4219983,-122.084&key=AIzaSyDEh-6si30SqmSpZLQNZ_-Y7zksH71u93o&signature=B9u-ihi5TbRHEAeYtWAoCBTzeYU=&signature=BT6kWruq4pQjUFSWEK0FPNsLKuE=';
  }
}

// signature=BASE64_SIGNATURE
var signUrl =
    'https://maps.googleapis.com/maps/api/staticmap?center=&37.4219983,-122.084&zoom=10&size=400x400&maptype=roadmap&markers=color:red%7Clabel:C%7C37.4219983,-122.084&key=AIzaSyDEh-6si30SqmSpZLQNZ_-Y7zksH71u93o&signature=B9u-ihi5TbRHEAeYtWAoCBTzeYU=&signature=BT6kWruq4pQjUFSWEK0FPNsLKuE=';
var unsignUrl =
    'https://maps.googleapis.com/maps/api/staticmap?center=&37.4219983,-122.084&zoom=10&size=400x400&maptype=roadmap&markers=color:red%7Clabel:C%7C37.4219983,-122.084&key=AIzaSyDEh-6si30SqmSpZLQNZ_-Y7zksH71u93o&signature=B9u-ihi5TbRHEAeYtWAoCBTzeYU=';
