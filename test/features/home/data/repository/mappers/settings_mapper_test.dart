import 'package:flutter_test/flutter_test.dart';
import 'package:monobox/features/home/data/models/settings_dto.dart';
import 'package:monobox/features/home/data/repository/mappers/settings_mapper.dart';
import 'package:monobox/features/home/domain/entities/settings_entity.dart';

void main() {
  group('SettingsMapper', () {
    test(
        'should map SettingsDto to SettingsEntity correctly when children is true',
        () {
      // Arrange
      final settingsDto = SettingsDto(
        loyalty: true,
        children: true,
      );

      // Act
      final settingsEntity = SettingsMapper.toEntity(settingsDto);

      // Assert
      expect(settingsEntity, isA<SettingsEntity>());
      expect(settingsEntity.children, true);
      expect(settingsEntity.loyalty, true);
    });

    test(
        'should map SettingsDto to SettingsEntity correctly when children is false',
        () {
      // Arrange
      final settingsDto = SettingsDto(
        loyalty: true,
        children: false,
      );

      // Act
      final settingsEntity = SettingsMapper.toEntity(settingsDto);

      // Assert
      expect(settingsEntity, isA<SettingsEntity>());
      expect(settingsEntity.children, false);
    });

    test(
        'should map SettingsDto to SettingsEntity with children as false when it is null',
        () {
      // Arrange
      final settingsDto = SettingsDto(
        loyalty: true,
        children: null,
      );

      // Act
      final settingsEntity = SettingsMapper.toEntity(settingsDto);

      // Assert
      expect(settingsEntity, isA<SettingsEntity>());
      expect(settingsEntity.children, false);
    });

    test(
        'should map SettingsDto to SettingsEntity correctly when callback is true',
        () {
      // Arrange
      final settingsDto = SettingsDto(
        loyalty: true,
        callback: true,
      );

      // Act
      final settingsEntity = SettingsMapper.toEntity(settingsDto);

      // Assert
      expect(settingsEntity, isA<SettingsEntity>());
      expect(settingsEntity.callback, true);
    });

    test(
        'should map SettingsDto to SettingsEntity correctly when callback is false',
        () {
      // Arrange
      final settingsDto = SettingsDto(
        loyalty: true,
        callback: false,
      );

      // Act
      final settingsEntity = SettingsMapper.toEntity(settingsDto);

      // Assert
      expect(settingsEntity, isA<SettingsEntity>());
      expect(settingsEntity.callback, false);
    });

    test(
        'should map SettingsDto to SettingsEntity with callback as false when it is null',
        () {
      // Arrange
      final settingsDto = SettingsDto(
        loyalty: true,
        callback: null,
      );

      // Act
      final settingsEntity = SettingsMapper.toEntity(settingsDto);

      // Assert
      expect(settingsEntity, isA<SettingsEntity>());
      expect(settingsEntity.callback, false);
    });
  });
}
