import '../../../domain/entities/category_entity.dart';
import '../../models/category_dto.dart';
import 'products_mapper.dart';

class CategoriesMapper {
  static CategoryEntity toCategoryEntity(
    CategoryDto category,
  ) {
    return CategoryEntity(
      id: category.id,
      title: category.title,
      picture: category.picture,
      products: category.products != null
          ? ProductsMapper.toProductsEntity(category.products!)
          : null,
      color: category.color,
      isCollection: category.isCollection,
    );
  }

  static List<CategoryEntity> toCategoriesEntity(
    List<CategoryDto> categories,
  ) {
    List<CategoryEntity> categoriesEntity = [];

    categories.map((c) => categoriesEntity.add(toCategoryEntity(c))).toList();

    return categoriesEntity;
  }
}
