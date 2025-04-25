import 'package:equatable/equatable.dart';

class BookingResponseEntity extends Equatable {
  final int id;
  final int customerId;
  final int? driverId;
  final int? vehicleId;
  final AddressEntity pickupAddress;
  final AddressEntity dropoffAddress;
  final String status;
  final String? scheduledTime;
  final String? pickupTime;
  final String? dropoffTime;
  final num estimatedDistance;
  final num estimatedDuration;
  final num estimatedFare;
  final num? actualFare;
  final PaymentMethodEntity? paymentMethod;
  final String paymentStatus;
  final DriverEntity? driver;
  final VehicleEntity? vehicle;
  final List<StopEntity>? stops;
  final String createdAt;
  final String updatedAt;

  const BookingResponseEntity({
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

  @override
  List<Object?> get props => [
        id,
        customerId,
        driverId,
        vehicleId,
        pickupAddress,
        dropoffAddress,
        status,
        scheduledTime,
        pickupTime,
        dropoffTime,
        estimatedDistance,
        estimatedDuration,
        estimatedFare,
        actualFare,
        paymentMethod,
        paymentStatus,
        driver,
        vehicle,
        stops,
        createdAt,
        updatedAt,
      ];
}

class AddressEntity extends Equatable {
  final Map<String, dynamic> propsMap;

  const AddressEntity({required this.propsMap});

  @override
  List<Object?> get props => [propsMap];
}

class PaymentMethodEntity extends Equatable {
  final Map<String, dynamic>? propsMap;

  const PaymentMethodEntity({required this.propsMap});

  @override
  List<Object?> get props => [propsMap];
}

class DriverEntity extends Equatable {
  final int id;
  final String name;
  final String phone;

  const DriverEntity({required this.id, required this.name, required this.phone});

  @override
  List<Object?> get props => [id, name, phone];
}

class VehicleEntity extends Equatable {
  final Map<String, dynamic>? propsMap;

  const VehicleEntity({required this.propsMap});

  @override
  List<Object?> get props => [propsMap];
}

class StopEntity extends Equatable {
  final LatLngEntity location;
  final int addressId;
  final int sequenceNumber;

  const StopEntity({
    required this.location,
    required this.addressId,
    required this.sequenceNumber,
  });

  @override
  List<Object?> get props => [location, addressId, sequenceNumber];
}

class LatLngEntity extends Equatable {
  final double latitude;
  final double longitude;

  const LatLngEntity({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}
