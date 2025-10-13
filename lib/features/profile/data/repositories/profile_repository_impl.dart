import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:http_parser/src/media_type.dart';
import 'package:monobox/features/profile/data/datasources/remote/feedback_service.dart';
import 'package:monobox/features/profile/data/models/child_dto.dart';
import 'package:monobox/features/profile/data/models/delete_profile_response_dto.dart';
import 'package:monobox/features/profile/data/models/notification_status_dto.dart';
import 'package:monobox/features/profile/domain/entities/add_child_request_entity.dart';
import 'package:monobox/features/profile/domain/entities/child_entity.dart';
import 'package:monobox/features/profile/domain/entities/delete_profile_entity.dart';
import 'package:monobox/features/profile/domain/entities/edit_user_entity.dart';
import 'package:monobox/features/profile/domain/entities/notification_entity.dart';
import 'package:monobox/features/profile/domain/entities/notification_item_entity.dart';
import 'package:monobox/features/profile/domain/entities/notification_status_entity.dart';

import 'package:monobox/features/profile/domain/entities/user_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entities/feedback_entity.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/remote/profile_api_service.dart';
import '../models/add_child_request_dto.dart';
import '../models/edit_user_dto.dart';
import '../models/notification_dto.dart';
import '../models/notification_item_dto.dart';
import '../models/profile_dto.dart';
import '../models/user_dto.dart';
import 'mappers/notification_item_mapper.dart';
import 'mappers/notification_mapper.dart';
import 'mappers/profile_mapper.dart';
import 'mappers/user_mapper.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({required this.service, required this.feedbackService});

  final ProfileApiService service;
  final FeedbackService feedbackService;

  @override
  Future<DataState<ProfileEntity>> getProfile() async {
    ProfileDto profile = await service.profile();

    return DataSuccess(
      ProfileMapper.toEntity(profile),
    );
  }

  @override
  Future<DataState<UserEntity>> editProfile(
      EditUserEntity editUserEntity) async {
    try {
      UserDto profile = await service.editProfile(EditUserDto(
        name: editUserEntity.name,
        email: editUserEntity.email,
        birthdate: editUserEntity.birthdate != null
            ? DateFormat('dd.MM.yyyy').format(editUserEntity.birthdate!)
            : null,
      ));

      return DataSuccess(
        UserMapper.toEntity(profile),
      );
    } on DioException catch (e) {
      final List<String> errors = [];
      if (e.response?.data != null) {
        if (e.response?.data.containsKey('errors')) {
          (e.response!.data['errors'] as Map<String, dynamic>).entries.map((v) {
            errors.add('${v.value[0]}');
          }).toList();
        }

        if (e.response?.data.containsKey('error')) {
          errors.add(e.response?.data['error']);
        }
      }

      return DataFailed(
        DioException(
          requestOptions: e.requestOptions,
          message: errors[0],
        ),
      );
    }
  }

  @override
  Future<DataState<List<ChildEntity>>> getChildren() async {
    try {
      List<ChildDto> childrens = await service.getChildrens();

      return DataSuccess([
        ...childrens.map((child) => ChildEntity(
              id: child.id,
              name: child.name,
              birthdate: DateFormat('dd.MM.yyyy').parse(child.birthdate),
            ))
      ]);
    } on DioException catch (e) {
      final List<String> errors = [];
      if (e.response?.data != null) {
        if (e.response?.data.containsKey('errors')) {
          (e.response!.data['errors'] as Map<String, dynamic>).entries.map((v) {
            errors.add('${v.value[0]}');
          }).toList();
        }

        if (e.response?.data.containsKey('error')) {
          errors.add(e.response?.data['error']);
        }
      }

      return DataFailed(
        DioException(
          requestOptions: e.requestOptions,
          message: errors[0],
        ),
      );
    }
  }

  @override
  Future<DataState<ChildEntity>> addChild(
      AddChildRequestEntity addChildRequestEntity) async {
    try {
      ChildDto child = await service.addChild(
        AddChildRequestDto(
          name: addChildRequestEntity.name,
          birthdate: DateFormat('dd.MM.yyyy').format(
            addChildRequestEntity.birthdate,
          ),
        ),
      );

      return DataSuccess(
        ChildEntity(
          id: child.id,
          name: child.name,
          birthdate: DateFormat('dd.MM.yyyy').parse(child.birthdate),
        ),
      );
    } on DioException catch (e) {
      final List<String> errors = [];
      if (e.response?.data != null) {
        if (e.response?.data.containsKey('errors')) {
          (e.response!.data['errors'] as Map<String, dynamic>).entries.map((v) {
            errors.add('${v.value[0]}');
          }).toList();
        }

        if (e.response?.data.containsKey('error')) {
          errors.add(e.response?.data['error']);
        }
      }

      return DataFailed(
        DioException(
          requestOptions: e.requestOptions,
          message: errors[0],
        ),
      );
    }
  }

  @override
  Future<DataState<List<NotificationEntity>>> getNotificationsSettings() async {
    try {
      List<NotificationDto> notifications =
          await service.getNotificationsSettings();

      return DataSuccess(
        NotificationMapper.toEntities(notifications),
      );
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
  Future<DataState<NotificationItemEntity>> changeNotificationStatus(
      NotificationStatusEntity status) async {
    try {
      NotificationItemDto notificationItem =
          await service.changeNotificationStatus(
        status.id,
        NotificationStatusDto(
          status: status.status,
        ),
      );

      return DataSuccess(
        NotificationItemMapper.toEntity(notificationItem),
      );
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
  Future<DataState<FeedbackEntity>> addOrderFeedback(
    int orderId,
    FeedbackEntity feedback,
  ) async {
    try {
      final multipartFiles = <MultipartFile>[];

      for (final file in feedback.photos) {
        final fileBytes = await file.readAsBytes();
        final multipartFile = MultipartFile.fromBytes(
          fileBytes,
          filename: file.path.split('/').last,
          contentType: MediaType('application', 'octet-stream'),
        );
        multipartFiles.add(multipartFile);
      }

      await feedbackService.addReview(
        orderId,
        feedback.grade1!,
        feedback.grade2!,
        feedback.grade3!,
        feedback.comment!,
        multipartFiles,
      );

      // await service.addReview(
      //   orderId,
      //   feedback.grade1!,
      //   feedback.grade2!,
      //   feedback.grade3!,
      //   feedback.comment!,
      //   multipartFiles,
      // );

      return const DataSuccess(
        FeedbackEntity(),
      );
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
  Future<DataState<DeleteProfileEntity>> deleteProfile() async {
    try {
      final DeleteProfileResponseDto response = await service.deleteProfile();

      return DataSuccess(DeleteProfileEntity(status: response.status));
    } on DioException catch (e) {
      final List<String> errors = [];
      if (e.response?.data != null) {
        if (e.response?.data.containsKey('errors')) {
          (e.response!.data['errors'] as Map<String, dynamic>).entries.map((v) {
            errors.add('${v.value[0]}');
          }).toList();
        }

        if (e.response?.data.containsKey('error')) {
          errors.add(e.response?.data['error']);
        }
      }

      return DataFailed(
        DioException(
          requestOptions: e.requestOptions,
          message: errors[0],
        ),
      );
    }
  }
}
