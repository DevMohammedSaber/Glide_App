import 'package:equatable/equatable.dart';

class BookingRequestEntity extends Equatable {
  final PickupLocationEntity pickupLocation;
  final int? pickupAddressId;
  final DropoffLocationEntity dropoffLocation;
  final int? dropoffAddressId;
  final String? scheduledTime;
  final String? vehicleType;
  final bool? isWheelchairNeeded;
  final int? paymentMethodId;
  final String? notes;

  const BookingRequestEntity({
    required this.pickupLocation,
    required this.dropoffLocation,
    this.pickupAddressId,
    this.dropoffAddressId,
    this.scheduledTime,
    this.vehicleType,
    this.isWheelchairNeeded,
    this.paymentMethodId,
    this.notes,
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
