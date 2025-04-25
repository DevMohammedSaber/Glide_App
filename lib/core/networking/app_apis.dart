class AppApis {
  // ==================== Server Configuration ====================
  static const String baseurl =
      'http://glide-platform-prod-new.eba-zumb62gt.ca-central-1.elasticbeanstalk.com/api/v1';
  static const googleKey = "AIzaSyAjd81ASzYtDiDOf4jwYBKwGx632-PRNGY";

  // ==================== Endpoints ====================
  static const String register = '$baseurl/auth/register';
  static const String login = '$baseurl/auth/login';
  static const String refreshToken = '$baseurl/auth/refresh';
  static const String booking = '$baseurl/taxi/ride/book';
  static String rideStatus({required int bookingId}) =>
      '$baseurl/taxi/ride/$bookingId';
  static String cancelRide({required int bookingId}) =>
      '$baseurl/taxi/ride/$bookingId/cancel';
}
