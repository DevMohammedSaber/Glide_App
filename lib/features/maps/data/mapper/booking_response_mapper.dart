import 'package:glide/features/maps/data/models/booking_response_model.dart';
import 'package:glide/features/maps/domain/entities/booking_response_entity.dart';

extension BookingRedponseModelMapper on BookingResponseModel {
  BookingResponseEntity toEntity() {
    return BookingResponseEntity(
      pickupLocation: pickupLocation.toEntity(),
      dropoffLocation: dropoffLocation.toEntity(),
      pickupAddressId: pickupAddressId?.toString() ?? '',
      dropoffAddressId: dropoffAddressId?.toString() ?? '',
      scheduledTime: scheduledTime ?? '',
      vehicleType: vehicleType ?? '',
      isWheelchairNeeded: (isWheelchairNeeded ?? false).toString(),
      paymentMethodId: paymentMethodId ?? 0,
      notes: notes ?? '',
    );
  }
}

extension PickupLocationMapper on PickupLocationModel {
  PickupLocationEntity toEntity() {
    return PickupLocationEntity(
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension DropoffLocationMapper on DropoffLocationModel {
  DropoffLocationEntity toEntity() {
    return DropoffLocationEntity(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
