import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:monobox/features/order/presentation/bloc/orders_list/orders_list_bloc.dart';
import 'package:monobox/injection_container.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/text_area.dart';
import '../../../home/presentation/widgets/bottom_sheet_container.dart';
import '../../../order/domain/entities/order_entity.dart';
import '../../domain/entities/add_feedback_entity.dart';
import '../../domain/entities/feedback_entity.dart';
import '../bloc/add_feedback/add_feedback_bloc.dart';
import '../bloc/feedback/feedback_cubit.dart';

class AddFeedbackButton extends StatefulWidget {
  const AddFeedbackButton({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  State<AddFeedbackButton> createState() => _AddFeedbackButtonState();
}

class _AddFeedbackButtonState extends State<AddFeedbackButton> {
  late TextEditingController commentController;

  @override
  void initState() {
    commentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FeedbackCubit cubit = FeedbackCubit();
    final AddFeedbackBloc bloc = getIt<AddFeedbackBloc>();

    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: AppColors.white,
            useRootNavigator: true,
            context: context,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  AppStyles.radiusBlock,
                ),
              ),
            ),
            builder: (BuildContext context) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: cubit,
                  ),
                  BlocProvider.value(
                    value: bloc,
                  ),
                ],
                child: BlocListener<AddFeedbackBloc, AddFeedbackState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      success: () {
                        getIt<OrdersListBloc>()
                            .add(const OrdersListEvent.getOrders());
                        AutoRouter.of(context).pop();
                      },
                      orElse: () => null,
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: BottomSheetContainer(
                      header: Text(
                        'Отзыв',
                        style: AppStyles.title1,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 32,
                            ),
                            BlocBuilder<FeedbackCubit, FeedbackState>(
                              builder: (context, state) {
                                return feedbackItem(
                                  title: 'Еда',
                                  subTitle: 'Как вам вкус, внешний вид?',
                                  grade: state.grade1,
                                  onTap: (int grade) {
                                    cubit.addGrade1(grade + 1);
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            BlocBuilder<FeedbackCubit, FeedbackState>(
                              builder: (context, state) {
                                return feedbackItem(
                                  title: 'Доставка',
                                  subTitle:
                                      'Своевременность доставки, целостность заказа',
                                  grade: state.grade2,
                                  onTap: (int grade) {
                                    cubit.addGrade2(grade + 1);
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            BlocBuilder<FeedbackCubit, FeedbackState>(
                              builder: (context, state) {
                                return feedbackItem(
                                  title: 'Приложение',
                                  subTitle:
                                      'Удобство использования, внешний вид и скорость работы',
                                  grade: state.grade3,
                                  onTap: (int grade) {
                                    cubit.addGrade3(grade + 1);
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: TextArea(
                                controller: commentController,
                                maxLength: 10000,
                                minLines: 10,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                              ),
                              child: BlocProvider.value(
                                value: cubit,
                                child: const TakePhotos(),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: BlocBuilder<AddFeedbackBloc,
                                    AddFeedbackState>(
                                  builder: (context, state) {
                                    return ElevatedButton(
                                      onPressed: state.maybeWhen(
                                        orElse: () => () {
                                          bloc.add(
                                            AddFeedbackEvent.addFeedback(
                                              AddFeedbackEntity(
                                                orderId: widget.order.id,
                                                feedback: FeedbackEntity(
                                                  grade1: cubit.state.grade1,
                                                  grade2: cubit.state.grade2,
                                                  grade3: cubit.state.grade3,
                                                  comment:
                                                      commentController.text,
                                                  photos: cubit.state.photos,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        loading: () => null,
                                      ),
                                      child: state.maybeWhen(
                                        orElse: () => const Text(
                                          'Отправить',
                                        ),
                                        loading: () => const SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: CircularProgressIndicator(
                                            color: AppColors.white,
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 41,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        style: AppStyles.superLightElevatedButton,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 24,
                child: Center(
                  child: Text(
                    'Оставить отзыв',
                    style: AppStyles.headline.copyWith(
                      color: AppColors.darkPrimary,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  'assets/icons/star.svg',
                  color: AppColors.darkPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget feedbackItem({
    required String title,
    required String subTitle,
    required int grade,
    required Function(int grade) onTap,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 268,
          child: Text(
            title,
            style: AppStyles.headline,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          width: 268,
          child: Text(
            subTitle,
            style: AppStyles.subhead.copyWith(
              color: AppColors.gray,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...List<Widget>.generate(
                5,
                (index) => GestureDetector(
                  onTap: () {
                    onTap(index);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2.6,
                      vertical: 4.1,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/feedback_star.svg',
                      color: grade > index ? AppColors.lightPrimary : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TakePhotos extends StatelessWidget {
  const TakePhotos({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<FeedbackCubit>();
    return Row(
      children: [
        SizedBox(
          width: 48,
          height: (48 + 5),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: GestureDetector(
              onTap: () async {
                showAdaptiveActionSheet(
                  context: context,
                  androidBorderRadius: 30,
                  actions: <BottomSheetAction>[
                    BottomSheetAction(
                      title: Text(
                        'Сделать фото',
                        style: AppStyles.bodyRegular.copyWith(
                          color: !Platform.isIOS
                              ? AppColors.black
                              : const Color(0xFF007AFF),
                        ),
                      ),
                      onPressed: (context) async {
                        await _pickImage(context, cubit, ImageSource.camera);
                        if (!context.mounted) return;
                        AutoRouter.of(context).pop();
                      },
                    ),
                    BottomSheetAction(
                      title: Text(
                        'Открыть галерею',
                        style: AppStyles.bodyRegular.copyWith(
                          color: !Platform.isIOS
                              ? AppColors.black
                              : const Color(0xFF007AFF),
                        ),
                      ),
                      onPressed: (context) async {
                        await _pickImage(context, cubit, ImageSource.gallery);
                        if (!context.mounted) return;
                        AutoRouter.of(context).pop();
                      },
                    ),
                  ],
                  cancelAction: CancelAction(
                    title: const Text(
                      'Отмена',
                    ),
                  ),
                );
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.superLight,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppStyles.radiusElement),
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 32,
                    height: 32,
                    padding: const EdgeInsets.only(
                      left: 3.44,
                      right: 3.44,
                      top: 5.67,
                      bottom: 4.58,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/photo.svg',
                      width: 25.3,
                      height: 21.75,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          child: SizedBox(
            height: (48 + 5),
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: cubit.state.photos.length,
              itemBuilder: (BuildContext context, int index) {
                final photo = cubit.state.photos[index];
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.superLight,
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppStyles.radiusElement),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(photo),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -5,
                      top: 0,
                      child: GestureDetector(
                        onTap: () => cubit.deletePhoto(index),
                        child: Container(
                          padding: const EdgeInsets.all(3.86),
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                            color: AppColors.dark,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/close.svg',
                            color: AppColors.gray,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 16,
                );
              },
            ),
          ),
        ),
        // ...cubit.state.photos.map(
        //   (photo) => Container(
        //     width: 48,
        //     height: 48,
        //     decoration: BoxDecoration(
        //       color: AppColors.superLight,
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(AppStyles.radiusElement),
        //       ),
        //       image: DecorationImage(
        //         fit: BoxFit.cover,
        //         image: FileImage(photo),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }

  Future<void> _pickImage(
    BuildContext context,
    FeedbackCubit cubit,
    ImageSource source,
  ) async {
    final image = await ImagePicker().pickImage(
      source: source,
    );

    if (image == null) return;

    final imageTmp = File(image.path);

    if (!context.mounted) return;

    cubit.addPhoto(imageTmp);
  }
}
