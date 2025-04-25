import 'package:glide/features/booking/data/models/booking_request_model.dart';
import 'package:glide/features/booking/domain/entities/booking_request_entity.dart';

extension BookingRequestModelMapper on BookingRequestEntity {
  BookingRequestModel toModel() {
    return BookingRequestModel(
      pickupLocation: pickupLocation.toModel(),
      dropoffLocation: dropoffLocation.toModel(),
      pickupAddressId: pickupAddressId,
      dropoffAddressId: dropoffAddressId ,
      scheduledTime: scheduledTime ,
      vehicleType: vehicleType ,
      isWheelchairNeeded: isWheelchairNeeded ,
      paymentMethodId: paymentMethodId,
      notes: notes,
    );
  }
}

extension PickupLocationMapper on PickupLocationEntity {
  PickupLocationModel toModel() {
    return PickupLocationModel(
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension DropoffLocationMapper on DropoffLocationEntity {
  DropoffLocationModel toModel() {
    return DropoffLocationModel(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
