import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:monobox/config/themes/colors.dart';
import 'package:monobox/injection_container.dart';

import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/input_text.dart';
import '../../../../core/widgets/warning_container.dart';
import '../../domain/entities/edit_user_entity.dart';
import '../bloc/cubit/edit_profile_form_cubit.dart';
import '../bloc/profile/profile_cubit.dart';
import '../bloc/update_profile/update_profile_bloc.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController nameTextController;
  late TextEditingController emailTextController;
  late TextEditingController birthDateTextController;
  late EditProfileFormCubit editProfileFormCubit;

  @override
  void initState() {
    editProfileFormCubit = EditProfileFormCubit();

    nameTextController = TextEditingController()..addListener(_validateName);
    emailTextController = TextEditingController()..addListener(_validateEmail);
    birthDateTextController = TextEditingController()
      ..addListener(_validateBirthDay);

    getIt<ProfileCubit>().state.mapOrNull(done: (state) {
      nameTextController.text = state.profile.user.name ?? '';
      emailTextController.text = state.profile.user.email ?? '';
      if (state.profile.user.birthdate != null) {
        birthDateTextController.text =
            DateFormat('dd.MM.yyyy').format(state.profile.user.birthdate!);
      }
    });

    super.initState();
  }

  void _validateEmail() {
    final emailAllowSymbols = RegExp(
        r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');

    editProfileFormCubit
        .validEmail(emailAllowSymbols.hasMatch(emailTextController.text));
    validateForm();
  }

  void _validateName() {
    editProfileFormCubit.validName(nameTextController.text.isNotEmpty);
    validateForm();
  }

  void _validateBirthDay() {
    editProfileFormCubit.validBirtday(birthDateTextController.text.isNotEmpty);
    validateForm();
  }

  void validateForm() {
    editProfileFormCubit.formValid(
      name: nameTextController.text,
      email: emailTextController.text,
      birthday: birthDateTextController.text,
    );
  }

  @override
  void dispose() {
    nameTextController.removeListener(_validateName);
    emailTextController.removeListener(_validateEmail);
    birthDateTextController.removeListener(_validateBirthDay);
    nameTextController.dispose();
    emailTextController.dispose();
    birthDateTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: editProfileFormCubit,
        ),
        BlocProvider.value(
          value: getIt<UpdateProfileBloc>(),
        ),
      ],
      child: BlocListener<UpdateProfileBloc, UpdateProfileState>(
        listener: (context, state) {
          if (state is Done) {
            getIt<ProfileCubit>().getProfile();
            AutoRouter.of(context).pop();
          }

          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: Container(
                  padding: const EdgeInsets.all(12),
                  //height: 88,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        AppStyles.radiusElement,
                      ),
                    ),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WarningContainer(),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ошибка',
                              style: AppStyles.bodyBold.copyWith(
                                color: AppColors.dark,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              (state.error as StateError).message,
                              style: AppStyles.footnote,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
        child: Column(
          children: [
            InputText(
              label: 'Имя',
              controller: nameTextController,
              hintText: 'Ваше имя',
            ),
            const SizedBox(
              height: 12,
            ),
            InputText(
              label: 'Email',
              controller: emailTextController,
              hintText: 'sushi@mail.mnom',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 12,
            ),
            InputText(
              label: 'Дата рождения',
              controller: birthDateTextController,
              hintText: 'дд.мм.гггг',
              readOnly: true,
              onTap: () async {
                if (birthDateTextController.text.isEmpty) {
                  DateTime? pickedDate = await showDatePicker(
                    locale: const Locale("ru"),
                    context: context,
                    initialDate: birthDateTextController.text.isNotEmpty
                        ? DateFormat('dd.MM.yyyy')
                            .parse(birthDateTextController.text)
                        : DateTime.now(),
                    firstDate: DateTime(
                        1900), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime.now(),
                  );

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd.MM.yyyy').format(pickedDate);

                    setState(() {
                      birthDateTextController.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    //print("Date is not selected");
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: Container(
                        padding: const EdgeInsets.all(12),
                        //height: 88,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              AppStyles.radiusElement,
                            ),
                          ),
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const WarningContainer(),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Внимание',
                                    style: AppStyles.bodyBold.copyWith(
                                      color: AppColors.dark,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Хотите изменить - обратитесь к оператору',
                                    style: AppStyles.footnote,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 28,
            ),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
                builder: (context, updateProfileState) {
                  return BlocBuilder<EditProfileFormCubit,
                      EditProfileFormState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state.validForm &&
                                updateProfileState is! Loading
                            ? () {
                                context.read<UpdateProfileBloc>().add(
                                      UpdateProfileEvent.update(
                                        EditUserEntity(
                                          name: nameTextController.text,
                                          email: emailTextController.text,
                                          birthdate: birthDateTextController
                                                  .text.isNotEmpty
                                              ? DateFormat('dd.MM.yyyy').parse(
                                                  birthDateTextController.text)
                                              : null,
                                        ),
                                      ),
                                    );
                              }
                            : null,
                        child: const Text(
                          'Сохранить',
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
