import 'package:glide/features/maps/data/models/booking_response_model.dart';
import 'package:glide/features/maps/domain/entities/booking_response_entity.dart';

extension BookingResponseModelMapper on BookingResponseModel {
  BookingResponseEntity toEntity() {
    return BookingResponseEntity(
      id: id,
      customerId: customerId,
      driverId: driverId,
      vehicleId: vehicleId,
      pickupAddress: AddressEntity(propsMap: pickupAddress),
      dropoffAddress: AddressEntity(propsMap: dropoffAddress),
      status: status,
      scheduledTime: scheduledTime,
      pickupTime: pickupTime,
      dropoffTime: dropoffTime,
      estimatedDistance: estimatedDistance,
      estimatedDuration: estimatedDuration,
      estimatedFare: estimatedFare,
      actualFare: actualFare,
      paymentMethod: PaymentMethodEntity(propsMap: paymentMethod),
      paymentStatus: paymentStatus,
      driver: DriverEntity(propsMap: driver),
      vehicle: VehicleEntity(propsMap: vehicle),
      stops: stops?.map((e) => e.toEntity()).toList(),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension StopModelMapper on StopModel {
  StopEntity toEntity() {
    return StopEntity(
      location: location.toEntity(),
      addressId: addressId,
      sequenceNumber: sequenceNumber,
    );
  }
}

extension LatLngModelMapper on LatLngModel {
  LatLngEntity toEntity() {
    return LatLngEntity(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
