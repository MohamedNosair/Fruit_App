import 'package:fruit_app/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  final String? name, email, address, city, addressDetails, phoneNumber;

  ShippingAddressModel({
    required this.name,
    required this.email,
    required this.address,
    required this.city,
    required this.addressDetails,
    required this.phoneNumber,
  });

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      address: entity.address,
      addressDetails: entity.addressDetails,
      city: entity.city,
      email: entity.email,
      name: entity.name,
      phoneNumber: entity.phoneNumber,
    );
  }
  toJson() {
    return {
      "name": name,
      "email": email,
      "address": address,
      "city": city,
      "addressDetails": addressDetails,
      "phoneNumber": phoneNumber,
    };
  }
}
