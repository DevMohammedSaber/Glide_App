import 'package:equatable/equatable.dart';

class BookingResponseEntity extends Equatable {
  final PickupLocationEntity pickupLocation;
  final String pickupAddressId;
  final DropoffLocationEntity dropoffLocation;
  final String dropoffAddressId;
  final String scheduledTime;
  final String vehicleType;
  final String isWheelchairNeeded;
  final int paymentMethodId;
  final String notes;

  const BookingResponseEntity({
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.pickupAddressId,
    required this.dropoffAddressId,
    required this.scheduledTime,
    required this.vehicleType,
    required this.isWheelchairNeeded,
    required this.paymentMethodId,
    required this.notes,
  });

  @override
  List<Object?> get props => [
        pickupLocation,
        pickupAddressId,
        dropoffAddressId,
        scheduledTime,
        vehicleType,
        isWheelchairNeeded,
        paymentMethodId,
        notes,
      ];
}

class PickupLocationEntity extends Equatable {
  final double latitude;
  final double longitude;

  const PickupLocationEntity({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [latitude, longitude];
}

class DropoffLocationEntity extends Equatable {
  final double latitude;
  final double longitude;

  const DropoffLocationEntity({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [latitude, longitude];
}
