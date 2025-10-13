import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:monobox/config/routes/app_router.dart';
import 'package:monobox/config/themes/colors.dart';
import 'package:monobox/config/themes/styles.dart';
import 'package:monobox/core/widgets/Info_conatiner.dart';
import 'package:monobox/core/widgets/custom_checkbox.dart';
import 'package:monobox/core/widgets/input_text.dart';
import 'package:monobox/core/widgets/rounded_container.dart';
import 'package:monobox/features/profile/domain/entities/loyalty_entry_request_entity.dart';
import 'package:monobox/features/profile/presentation/bloc/cubit/edit_profile_form_cubit.dart';
import 'package:monobox/features/profile/presentation/bloc/loyalty_entry/loyalty_entry_bloc.dart';
import 'package:monobox/features/profile/presentation/bloc/profile/profile_cubit.dart';
import 'package:monobox/injection_container.dart';

@RoutePage()
class LoyalEntityPage extends StatefulWidget {
  const LoyalEntityPage({
    super.key,
  });

  @override
  State<LoyalEntityPage> createState() => _LoyalEntityPageState();
}

class _LoyalEntityPageState extends State<LoyalEntityPage> {
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

    validateForm();
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
    editProfileFormCubit.formValid2(
      name: nameTextController.text,
      email: emailTextController.text,
      birthday: birthDateTextController.text,
      acceptLoyality: editProfileFormCubit.state.acceptLoyality,
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
          value: getIt<LoyaltyEntryBloc>(),
        ),
        BlocProvider<EditProfileFormCubit>.value(
          value: editProfileFormCubit,
        ),
      ],
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.white.withOpacity(.05),
              blurRadius: 8.0,
              offset: const Offset(
                0.0,
                4.0,
              ),
            )
          ],
        ),
        child: AppBar(
          elevation: 0.0,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          titleSpacing: 0,
          leadingWidth: (32 + 16),
          leading: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => context.popRoute(),
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: 17.33,
                      height: 12.67,
                      child: SvgPicture.asset(
                        'assets/icons/arrow_back_android.svg',
                        width: 17.33,
                        height: 5,
                        colorFilter: const ColorFilter.mode(
                          AppColors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Копите бонусы',
                  style: AppStyles.headline.copyWith(height: 1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EditProfileFormCubit, EditProfileFormState>(
          listener: (context, state) {
            validateForm();
          },
          listenWhen: (previous, current) =>
              previous.acceptLoyality != current.acceptLoyality,
        ),
        BlocListener<LoyaltyEntryBloc, LoyaltyEntryState>(
          listener: (context, state) {
            state.maybeWhen(
              initial: () {},
              orElse: () => null,
              success: (response) {
                context.router.replace(const ProfileRoute());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(
                      seconds: 10,
                    ),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const InfoContainer(),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Вы зарегистрированы!',
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
                                  response.message,
                                  style: AppStyles.footnote.copyWith(
                                    color: AppColors.gray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            RoundedContainer(
              header: Text(
                'Программа лояльности',
                style: AppStyles.headline,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  InputText(
                    label: 'Имя*',
                    controller: nameTextController,
                    hintText: 'Ваше имя',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  InputText(
                    label: 'Email*',
                    controller: emailTextController,
                    hintText: 'sushi@mail.mnom',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  InputText(
                    label: 'Дата рождения*',
                    controller: birthDateTextController,
                    hintText: 'дд.мм.гггг',
                    readOnly: true,
                    onTap: () async {
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
                    },
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  CustomCheckBox(
                    selected: editProfileFormCubit.state.acceptLoyality,
                    onSelect: (value) =>
                        editProfileFormCubit.acceptLoyality(value),
                    label: 'Я хочу учавствовать в программе лояльности',
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: BlocBuilder<LoyaltyEntryBloc, LoyaltyEntryState>(
                      builder: (context, loyaltyEntryState) {
                        return BlocBuilder<EditProfileFormCubit,
                            EditProfileFormState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: state.validForm &&
                                      loyaltyEntryState.maybeWhen(
                                        orElse: () => true,
                                        saving: () => false,
                                      )
                                  ? () {
                                      context.read<LoyaltyEntryBloc>().add(
                                            LoyaltyEntryEvent
                                                .postLoyaltyRequest(
                                              LoyaltyEntryRequestEntity(
                                                name: nameTextController.text,
                                                email: emailTextController.text,
                                                birthdate:
                                                    birthDateTextController
                                                        .text,
                                              ),
                                            ),
                                          );
                                    }
                                  : null,
                              child: const Text(
                                'Зарегистрироваться',
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
