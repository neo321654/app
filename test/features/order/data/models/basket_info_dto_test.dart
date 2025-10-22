import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:monobox/features/order/data/models/basket_info_dto.dart';

void main() {
  group('BasketInfoDto', () {
    test('fromJson should parse correctly with profile_bonus', () {
      // Arrange
      const jsonString = '''
      {
        "products": [],
        "total_info": {
          "total": 0,
          "discount_price": 0
        },
        "pretotal_info": [],
        "bonus_info": {
          "price": 0,
          "count": 0,
          "weight": 0,
          "volume": 0
        },
        "warnings": [],
        "profile_bonus": {
          "total_bonus": 100,
          "available_bonus": 50
        }
      }
      ''';
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      // Act
      final basketInfoDto = BasketInfoDto.fromJson(jsonMap);

      // Assert
      expect(basketInfoDto.profileBonus, isNotNull);
      expect(basketInfoDto.profileBonus!.totalBonus, 100);
      expect(basketInfoDto.profileBonus!.availableBonus, 50);
    });

    test('fromJson should handle null profile_bonus', () {
      // Arrange
      const jsonString = '''
      {
        "products": [],
        "total_info": {
          "total": 0,
          "discount_price": 0
        },
        "pretotal_info": [],
        "bonus_info": {
          "price": 0,
          "count": 0,
          "weight": 0,
          "volume": 0
        },
        "warnings": [],
        "profile_bonus": null
      }
      ''';
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      // Act
      final basketInfoDto = BasketInfoDto.fromJson(jsonMap);

      // Assert
      expect(basketInfoDto.profileBonus, isNull);
    });
  });
}
