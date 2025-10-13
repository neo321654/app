import '../../../domain/entities/settings_entity.dart';
import '../../models/settings_dto.dart';

class SettingsMapper {
  static SettingsDto toModel(
    SettingsEntity model,
  ) {
    return SettingsDto(
      socnet: model.socnet != null
          ? SocnetDto(
              vk: model.socnet!.vk,
              tg: model.socnet!.tg,
              insta: model.socnet!.insta,
            )
          : null,
      pdf: model.pdf != null
          ? PdfDto(
              politic: model.pdf!.politic,
            )
          : null,
      feedback: model.feedback != null
          ? FeedbackDto(
              vk: model.feedback!.vk,
              tg: model.feedback!.tg,
              phone: model.feedback!.phone,
              wa: model.feedback!.wa,
            )
          : null,
      monobox: model.monobox != null
          ? MonoboxDto(
              link: model.monobox!.link,
            )
          : null,
      loyalty: model.loyalty,
    );
  }

  static SettingsEntity toEntity(
    SettingsDto model,
  ) {
    return SettingsEntity(
      socnet: model.socnet != null
          ? SocnetEntity(
              vk: model.socnet!.vk,
              tg: model.socnet!.tg,
              insta: model.socnet!.insta,
            )
          : null,
      pdf: model.pdf != null
          ? PdfEntity(
              politic: model.pdf!.politic,
            )
          : null,
      feedback: model.feedback != null
          ? FeedbackEntity(
              vk: model.feedback!.vk,
              tg: model.feedback!.tg,
              phone: model.feedback!.phone,
              wa: model.feedback!.wa,
            )
          : null,
      monobox: model.monobox != null
          ? MonoboxEntity(
              link: model.monobox!.link,
            )
          : null,
      loyalty: model.loyalty,
      children: model.children ?? false,
    );
  }
}
