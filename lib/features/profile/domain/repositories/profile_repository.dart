import 'package:monobox/features/profile/domain/entities/delete_profile_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/add_child_request_entity.dart';
import '../entities/child_entity.dart';
import '../entities/edit_user_entity.dart';
import '../entities/feedback_entity.dart';
import '../entities/notification_entity.dart';
import '../entities/notification_item_entity.dart';
import '../entities/notification_status_entity.dart';
import '../entities/profile_entity.dart';
import '../entities/user_entity.dart';

abstract class ProfileRepository {
  Future<DataState<ProfileEntity>> getProfile();
  Future<DataState<DeleteProfileEntity>> deleteProfile();
  Future<DataState<UserEntity>> editProfile(EditUserEntity editUserEntity);
  Future<DataState<List<ChildEntity>>> getChildren();
  Future<DataState<ChildEntity>> addChild(
      AddChildRequestEntity addChildRequestEntity);

  Future<DataState<List<NotificationEntity>>> getNotificationsSettings();
  Future<DataState<NotificationItemEntity>> changeNotificationStatus(
    NotificationStatusEntity status,
  );

  Future<DataState<FeedbackEntity>> addOrderFeedback(
    int orderId,
    FeedbackEntity feedback,
  );
}
