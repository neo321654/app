import 'package:dadata/dadata.dart';

import '../../../domain/entities/geolocate_address_entity.dart';

class AddressSuggestionMapper {
  static GeolocateAddressEntity toGeolocateAddressEntity(
    DadataSuggestion<AddressSuggestionData> addressSuggestion,
  ) {
    return GeolocateAddressEntity(
      value: addressSuggestion.value,
      lat: addressSuggestion.data?.geoLat?.isNotEmpty == true
          ? double.parse(addressSuggestion.data!.geoLat!)
          : null,
      lon: addressSuggestion.data?.geoLon?.isNotEmpty == true
          ? double.parse(addressSuggestion.data!.geoLon!)
          : null,
      city: addressSuggestion.data?.city,
      house: addressSuggestion.data?.house,
      street: addressSuggestion.data?.street,
    );
  }
}
