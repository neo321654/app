import '../../../../more/domain/entities/shop_entity.dart';
import '../../models/filial_dto.dart';

class FilialMapper {
  static ShopEntity toEntity(FilialDto model) {
    final List<String> workTime = model.rezhim?.map((rezhimMap) {
          final days = rezhimMap['days'] as String? ?? '';
          final time = rezhimMap['time'] as String? ?? '';
          return '$days $time';
        }).toList() ??
        [];

    return ShopEntity(
      id: model.id,
      address: model.name,
      cityId: model.cityId ?? 0,
      lat: model.coordinates.lat,
      lon: model.coordinates.lon,
      openTime: model.rezhimToday,
      workTime: workTime,
      waitingTime: parseTimeDelay(model.timeDelay),
      distance: model.distance,
    );
  }

  static List<ShopEntity> toEntities(List<FilialDto> models) {
    return models.map((model) => toEntity(model)).toList();
  }

  static int? parseTimeDelay(String? timeDelay) {
    if (timeDelay == null) return null;
    final match = RegExp(r'\d+').firstMatch(timeDelay);
    return match != null ? int.tryParse(match.group(0)!) : null;
  }
}
