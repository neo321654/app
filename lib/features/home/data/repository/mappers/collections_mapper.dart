import '../../../domain/entities/collection_entity.dart';
import '../../models/collection_dto.dart';
import '../../models/collections_dto.dart';
import 'products_mapper.dart';

class CollectionsMapper {
  static CollectionDto toModel(
    CollectionEntity model,
  ) {
    return CollectionDto(
      id: model.id,
      name: model.title,
      picture: model.picture,
      products: model.products != null
          ? ProductsMapper.toProductsModel(model.products!)
          : null,
      isCollection: model.isCollection,
      color: model.color,
    );
  }

  static List<CollectionDto> toModels(
    List<CollectionEntity> entities,
  ) {
    List<CollectionDto> models = [];

    entities.map((p) => models.add(toModel(p))).toList();

    return models;
  }

  static CollectionEntity toEntity(
    CollectionDto model,
  ) {
    return CollectionEntity(
      id: model.id,
      title: model.name,
      picture: model.picture,
      products: model.products != null
          ? ProductsMapper.toProductsEntity(model.products!)
          : null,
      isCollection: model.isCollection,
      color: model.color,
    );
  }

  static List<CollectionEntity> toEntities(
    CollectionsDto models,
  ) {
    List<CollectionEntity> entities = [];

    models.collections?.map((p) => entities.add(toEntity(p))).toList();

    return entities;
  }
}
