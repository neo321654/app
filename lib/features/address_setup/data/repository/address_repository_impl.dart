import 'package:dadata/dadata.dart';
import 'package:dio/dio.dart';
import 'package:monobox/features/address_setup/domain/entities/address_create_entity.dart';
import 'package:monobox/features/address_setup/domain/entities/city_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/entities/geolocate_address_entity.dart';
import '../../domain/repository/address_repository.dart';
import '../data_sources/remote/address_api_service.dart';
import '../models/address_dto.dart';
import 'mappers/address_create_mapper.dart';
import 'mappers/address_mapper.dart';
import 'mappers/address_suggestion_mapper.dart';

class AddressRepositoryImpl implements AddressRepository {
  final DadataClient dadataClient;
  final AddressApiService service;

  AddressRepositoryImpl({
    required this.dadataClient,
    required this.service,
  });

  @override
  Future<DataState<GeolocateAddressEntity>?> getGeolocateAddress(
    double lat,
    double lon,
  ) async {
    final DadataResponse<AddressSuggestionData>? resp =
        await dadataClient.geolocateAddress(
      RevgeocodeSuggestionRequest(
        latitude: lat,
        longitude: lon,
        count: 1,
      ),
    );
    if (resp != null) {
      if (resp.suggestions.isNotEmpty) {
        return DataSuccess(
          AddressSuggestionMapper.toGeolocateAddressEntity(
            resp.suggestions[0],
          ),
        );
      }
    } else {}
    return null;
  }

  @override
  Future<DataState<List<CityEntity>>?> getCityForDelivery() async {
    await Future.delayed(const Duration(seconds: 2));
    return const DataSuccess(
        //_mockCities.take(Random().nextInt(16)).toList(),
        //_mockCities.take(16).toList(),
        []);
  }

  // final _mockCities = const [
  //   CityEntity(
  //     name: 'Набережные челны',
  //     kladr: '1',
  //   ),
  //   CityEntity(
  //     name: 'Казань',
  //     kladr: '2',
  //   ),
  //   CityEntity(
  //     name: 'Нижнекамск',
  //     kladr: '3',
  //   ),
  //   CityEntity(
  //     name: 'Ижевск',
  //     kladr: '4',
  //   ),
  //   CityEntity(
  //     name: 'Курск',
  //     kladr: '5',
  //   ),
  //   CityEntity(
  //     name: 'Белгород',
  //     kladr: '6',
  //   ),
  //   CityEntity(
  //     name: 'Воронеж',
  //     kladr: '7',
  //   ),
  //   CityEntity(
  //     name: 'Ростов на Дону',
  //     kladr: '8',
  //   ),
  //   CityEntity(
  //     name: 'Краснодар',
  //     kladr: '9',
  //   ),
  //   CityEntity(
  //     name: 'Сочи',
  //     kladr: '10',
  //   ),
  //   CityEntity(
  //     name: 'Ставрополь',
  //     kladr: '11',
  //   ),
  //   CityEntity(
  //     name: 'Кисловодск',
  //     kladr: '12',
  //   ),
  //   CityEntity(
  //     name: 'Архыз',
  //     kladr: '13',
  //   ),
  //   CityEntity(
  //     name: 'Новороссийск',
  //     kladr: '14',
  //   ),
  //   CityEntity(
  //     name: 'Москва',
  //     kladr: '15',
  //   ),
  //   CityEntity(
  //     name: 'Тула',
  //     kladr: '16',
  //   ),
  // ];

  @override
  Future<DataState<AddressEntity>> addAddress(
    AddressCreateEntity addressRequest,
  ) async {
    AddressDto address = await service.create(
      AddressCreateMapper.toModel(
        addressRequest,
      ),
    );

    return DataSuccess(
      AddressMapper.toEntity(address),
    );
  }

  @override
  Future<DataState<void>> deleteAddress(int id) async {
    return DataSuccess(await service.delete(id));
  }

  @override
  Future<DataState<AddressEntity>> editAddress(AddressEntity address) async {
    try {
      AddressDto addressInput = AddressMapper.toModel(address);
      AddressDto addressOutput = await service.edit(
        addressInput.id,
        addressInput,
      );
      return DataSuccess(AddressMapper.toEntity(addressOutput));
    } on DioException catch (e) {
      return DataFailed(
        DioException(
          requestOptions: e.requestOptions,
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<DataState<List<AddressEntity>>> getAddresses() async {
    List<AddressDto> addresses = await service.getAddresses();

    return DataSuccess(
      [
        ...addresses.reversed.map(
          (address) => AddressMapper.toEntity(address),
        ),
      ],
    );
  }
}
