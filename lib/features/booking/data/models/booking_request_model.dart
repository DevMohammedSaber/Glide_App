class BookingRequestModel {
  final PickupLocationModel pickupLocation;
  int? pickupAddressId;
  final DropoffLocationModel dropoffLocation;
  int? dropoffAddressId;
  String? scheduledTime;
  final String vehicleType;
  bool? isWheelchairNeeded;
  int? paymentMethodId;
  String? notes;

  BookingRequestModel({
    required this.pickupLocation,
    this.pickupAddressId,
    required this.dropoffLocation,
    this.dropoffAddressId,
    this.scheduledTime,
    required this.vehicleType,
    this.isWheelchairNeeded,
    this.paymentMethodId,
    this.notes,
  });
  factory BookingRequestModel.fromJson(Map<String, dynamic> json) {
    return BookingRequestModel(
      pickupLocation: PickupLocationModel.fromJson(json['pickup_location']),
      pickupAddressId: json['pickup_address_id'],
      dropoffLocation: DropoffLocationModel.fromJson(json['dropoff_location']),
      dropoffAddressId: json['dropoff_address_id'],
      scheduledTime: json['scheduled_time'],
      vehicleType: json['vehicle_type'],
      isWheelchairNeeded: json['is_wheelchair_needed'],
      paymentMethodId: json['payment_method_id'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pickup_location'] = pickupLocation.toJson();
    if (pickupAddressId != null) data['pickup_address_id'] = pickupAddressId;
    if (pickupAddressId != null) data['pickup_address_id'] = pickupAddressId;
    data['dropoff_location'] = dropoffLocation.toJson();
    if (dropoffAddressId != null) {
      data['dropoff_address_id'] = dropoffAddressId;
    }
    if (scheduledTime != null) {
      data['scheduled_time'] = scheduledTime;
    }
    data['vehicle_type'] = vehicleType;
    if (isWheelchairNeeded != null) {
      data['is_wheelchair_needed'] = isWheelchairNeeded;
    }
    if (paymentMethodId != null) {
      data['payment_method_id'] = paymentMethodId;
    }
    if (notes != null) {
      data['notes'] = notes;
    }
    return data;
  }
}

class PickupLocationModel {
  final double latitude;
  final double longitude;

  PickupLocationModel({required this.latitude, required this.longitude});

  factory PickupLocationModel.fromJson(Map<String, dynamic> json) {
    return PickupLocationModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class DropoffLocationModel {
  final double latitude;
  final double longitude;

  DropoffLocationModel({required this.latitude, required this.longitude});

  factory DropoffLocationModel.fromJson(Map<String, dynamic> json) {
    return DropoffLocationModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
