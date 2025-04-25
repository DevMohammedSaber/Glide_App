class BookingResponseModel {
  int id;
  int customerId;
  int? driverId;
  int? vehicleId;
  Map<String, dynamic> pickupAddress;
  Map<String, dynamic> dropoffAddress;
  String status;
  String? scheduledTime;
  String? pickupTime;
  String? dropoffTime;
  num estimatedDistance;
  num estimatedDuration;
  num estimatedFare;
  num? actualFare;
  Map<String, dynamic>? paymentMethod;
  String paymentStatus;
  Map<String, dynamic>? driver;
  Map<String, dynamic>? vehicle;
  List<StopModel>? stops;
  String createdAt;
  String updatedAt;

  BookingResponseModel({
    required this.id,
    required this.customerId,
    required this.driverId,
    required this.vehicleId,
    required this.pickupAddress,
    required this.dropoffAddress,
    required this.status,
    required this.scheduledTime,
    required this.pickupTime,
    required this.dropoffTime,
    required this.estimatedDistance,
    required this.estimatedDuration,
    required this.estimatedFare,
    required this.actualFare,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.driver,
    required this.vehicle,
    required this.stops,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) {
    return BookingResponseModel(
      id: json['id'],
      customerId: json['customer_id'],
      driverId: json['driver_id'],
      vehicleId: json['vehicle_id'],
      pickupAddress: json['pickup_address'],
      dropoffAddress: json['dropoff_address'],
      status: json['status'],
      scheduledTime: json['scheduled_time'],
      pickupTime: json['pickup_time'],
      dropoffTime: json['dropoff_time'],
      estimatedDistance: json['estimated_distance'],
      estimatedDuration: json['estimated_duration'],
      estimatedFare: json['estimated_fare'],
      actualFare: json['actual_fare'],
      paymentMethod: json['payment_method'],
      paymentStatus: json['payment_status'],
      driver: json['driver'],
      vehicle: json['vehicle'],
      stops: (json['stops'] as List<dynamic>? ?? [])
          .map((e) => StopModel.fromJson(e))
          .toList(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class StopModel {
  final LatLngModel location;
  final int addressId;
  final int sequenceNumber;

  StopModel({
    required this.location,
    required this.addressId,
    required this.sequenceNumber,
  });

  factory StopModel.fromJson(Map<String, dynamic> json) {
    return StopModel(
      location: LatLngModel.fromJson(json['location']),
      addressId: json['address_id'],
      sequenceNumber: json['sequence_number'],
    );
  }
}

class LatLngModel {
  final double latitude;
  final double longitude;

  LatLngModel({required this.latitude, required this.longitude});

  factory LatLngModel.fromJson(Map<String, dynamic> json) {
    return LatLngModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
