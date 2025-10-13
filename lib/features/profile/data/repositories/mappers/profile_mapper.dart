import '../../../domain/entities/profile_entity.dart';
import '../../models/profile_dto.dart';
import 'profile_address_mapper.dart';
import 'profile_bonus_mapper.dart';
import 'profile_card_mapper.dart';
import 'profile_child_mapper.dart';
import 'user_mapper.dart';

class ProfileMapper {
  static ProfileDto toModel(
    ProfileEntity model,
  ) {
    return ProfileDto(
      user: UserMapper.toModel(model.user),
      addresses:
          model.addresses.map((a) => ProfileAddressMapper.toModel(a)).toList(),
      children:
          model.children.map((ch) => ProfileChildMapper.toModel(ch)).toList(),
      cards: model.cards.map((c) => ProfileCardMapper.toModel(c)).toList(),
      bonus:
          model.bonus != null ? ProfileBonusMapper.toModel(model.bonus!) : null,
    );
  }

  static ProfileEntity toEntity(
    ProfileDto model,
  ) {
    return ProfileEntity(
      user: UserMapper.toEntity(model.user),
      addresses:
          model.addresses.map((a) => ProfileAddressMapper.toEntity(a)).toList(),
      children:
          model.children.map((ch) => ProfileChildMapper.toEntity(ch)).toList(),
      cards: model.cards.map((c) => ProfileCardMapper.toEntity(c)).toList(),
      bonus: model.bonus != null
          ? ProfileBonusMapper.toEntity(model.bonus!)
          : null,
    );
  }
}
