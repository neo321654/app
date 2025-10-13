import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/config/routes/app_router.dart';
import 'package:monobox/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/custom_checkbox.dart';
import '../../../../core/widgets/input_text.dart';
import '../../../../core/widgets/warning_container.dart';
import '../../../../injection_container.dart';
import '../bloc/send_code/send_code_bloc.dart';
import '../bloc/cubit/auth_form_cubit.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
    this.onResult,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();

  final void Function(bool)? onResult;
}

class _AuthPageState extends State<AuthPage> {
  late MaskedTextController phoneController;
  late AuthFormCubit authFormCubit;

  bool get validatePhoneStatus =>
      phoneController.text.isNotEmpty && phoneController.text.length == 15;

  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    authFormCubit = AuthFormCubit();
    phoneController = MaskedTextController(
      mask: '(000) 000-00-00',
    )..addListener(_validatePhone);
    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();
    phoneController.dispose();
    focusNode.dispose();

    super.dispose();
  }

  void _validatePhone() {
    authFormCubit.validPhone(validatePhoneStatus);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => authFormCubit..startTimer(),
        ),
        BlocProvider.value(
          value: getIt<SendCodeBloc>(),
        ),
      ],
      child: BlocConsumer<SendCodeBloc, SendCodeState>(
        listener: (context, state) {
          if (state is AuthSentCode) {
            authFormCubit.setUserPhone(phoneController.text);
            authFormCubit.codeSent(true);
            authFormCubit.setTimeCount(state.getCodeStatusEntity.expired != null
                ? (state.getCodeStatusEntity.expired!).round()
                : 60);
          }
          if (state is RecivedToken) {
            context.read<AuthBloc>().add(
                  LoginRequested(
                    state.accessTokenEntity.accessToken,
                  ),
                );

            ///AutoRouter.of(context).replace(const ProfileRoute());
            //AutoRouter.of(context).navigate(const BaseRoute());
            //AutoRouter.of(context).back();
            if (widget.onResult != null) {
              widget.onResult!(true);
            } else {
              AutoRouter.of(context).replace(const BaseRoute());
            }
          }

          if (state is AuthFailure) {
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
                          children: [
                            // Text(
                            //   state.message,
                            //   style: AppStyles.bodyBold.copyWith(
                            //     color: AppColors.dark,
                            //   ),
                            //   overflow: TextOverflow.ellipsis,
                            //   maxLines: 1,
                            //   softWrap: false,
                            // ),
                            // SizedBox(height: 4,),
                            Text(
                              state.message,
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
        builder: (context, state) {
          return Scaffold(
            body: Builder(builder: (context) {
              return _buildBody(context);
            }),
          );
        },
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    final defaultPinTheme = PinTheme(
      width: 55,
      height: 74,
      textStyle: AppStyles.title1,
      decoration: BoxDecoration(
        color: AppColors.lightScaffoldBackground,
        borderRadius: BorderRadius.circular(AppStyles.radiusElement),
        //border: Border.all(color: borderColor),
      ),
    );

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                top: 28,
                right: 16,
                bottom: 80,
                left: 16,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppStyles.radiusBlock),
                  topRight: Radius.circular(AppStyles.radiusBlock),
                ),
              ),
              child: BlocBuilder<AuthFormCubit, AuthFormState>(
                builder: (context, state) {
                  if (!state.codeSent) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Введите номер, чтобы продолжить',
                          style: AppStyles.title3,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        BlocBuilder<AuthFormCubit, AuthFormState>(
                          builder: (context, state) {
                            return InputText(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              hintText: '(999) 999-99-99',
                              prefixIcon: Container(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  right: 6,
                                ),
                                child: Text(
                                  '+7',
                                  style: AppStyles.bodyBold.copyWith(
                                    color: AppColors.black,
                                    height: 1.35,
                                  ),
                                  //textAlign: TextAlign.center,
                                ),
                              ),
                              prefixIconConstraints: const BoxConstraints(
                                minWidth: 0,
                                minHeight: 0,
                              ),
                              suffixIcon: state.phoneValid
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(right: 17.5),
                                      child: SvgPicture.asset(
                                        'assets/icons/check.svg',
                                        color: AppColors.positive,
                                        width: 12.5,
                                        height: 8.5,
                                      ),
                                    )
                                  : null,
                              suffixIconConstraints: const BoxConstraints(
                                minWidth: 0,
                                minHeight: 0,
                              ),
                              style: AppStyles.bodyBold.copyWith(
                                color: AppColors.black,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          height: 49,
                          child: BlocBuilder<SendCodeBloc, SendCodeState>(
                            builder: (context, authState) {
                              return BlocBuilder<AuthFormCubit, AuthFormState>(
                                builder: (context, state) {
                                  return ElevatedButton(
                                    onPressed: state.acceptUserAgreement &&
                                            state.phoneValid &&
                                            authState is! SendCodeSending
                                        ? () {
                                            authFormCubit.setTimeCount(60);
                                            context.read<SendCodeBloc>().add(
                                                  RequestCode(
                                                    phone: phoneController.text,
                                                  ),
                                                );
                                          }
                                        : null,
                                    child: Center(
                                      child: (authState is SendCodeSending)
                                          ? const SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: CircularProgressIndicator(
                                                color: AppColors.white,
                                                strokeWidth: 2,
                                              ),
                                            )
                                          : Text(
                                              'Получить код',
                                              style:
                                                  AppStyles.bodyBold.copyWith(
                                                color: AppColors.white,
                                              ),
                                            ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomCheckBox(
                          selected: context
                              .read<AuthFormCubit>()
                              .state
                              .acceptLoyality,
                          onSelect: (value) => context
                              .read<AuthFormCubit>()
                              .acceptLoyality(value),
                          label: 'Я хочу учавствовать в программе лояльности',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: AppStyles.footnote,
                              children: [
                                TextSpan(
                                  text:
                                      'При входе или регистрации вы принимаете\nусловия ',
                                  style: AppStyles.footnote,
                                ),
                                TextSpan(
                                  text: 'пользовательского соглашения',
                                  style: AppStyles.footnote.copyWith(
                                    color: AppColors.lightPrimary,
                                  ),
                                ),
                                TextSpan(
                                  text: '.',
                                  style: AppStyles.footnote,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Введите код из СМС, чтобы продолжить',
                        style: AppStyles.title3,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 20,
                        child: Center(
                          child: BlocBuilder<SendCodeBloc, SendCodeState>(
                            builder: (context, state) {
                              return Visibility(
                                visible: state is AuthCheckCodeFailure
                                    ? true
                                    : false,
                                child: (state is AuthCheckCodeFailure)
                                    ? Text(
                                        state.message,
                                        style: AppStyles.subheadBold.copyWith(
                                          color: AppColors.destructive,
                                        ),
                                      )
                                    : Container(),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.5),
                        child: Pinput(
                          autofocus: true,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          controller: pinController,
                          focusNode: focusNode,
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          //androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
                          listenForMultipleSmsOnAndroid: true,
                          defaultPinTheme: defaultPinTheme,
                          separatorBuilder: (index) => const SizedBox(width: 8),
                          // validator: (value) {
                          //   return value == '2222' ? null : '';
                          // },
                          // onClipboardFound: (value) {
                          //   debugPrint('onClipboardFound: $value');
                          //   pinController.setText(value);
                          // },
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          onCompleted: (pin) {
                            debugPrint('onCompleted: $pin');
                            context.read<SendCodeBloc>().add(
                                  Login(
                                    phone: authFormCubit.state.userPhone ?? '',
                                    code: pin,
                                  ),
                                );
                          },
                          onChanged: (value) {
                            debugPrint('onChanged: $value');
                          },
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 24),
                                width: 13,
                                height: 3,
                                color: AppColors.gray,
                              ),
                            ],
                          ),
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              border: Border.all(color: AppColors.lightPrimary),
                            ),
                          ),
                          // submittedPinTheme: defaultPinTheme.copyWith(
                          //   decoration: defaultPinTheme.decoration!.copyWith(
                          //     color: fillColor,
                          //     borderRadius: BorderRadius.circular(19),
                          //     border: Border.all(color: focusedBorderColor),
                          //   ),
                          // ),
                          errorPinTheme: defaultPinTheme.copyBorderWith(
                            border: Border.all(
                              color: AppColors.destructive,
                            ),
                          ),
                          errorBuilder: (errorText, pin) => Container(),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: BlocBuilder<AuthFormCubit, AuthFormState>(
                          builder: (context, state) {
                            return Text(
                              'На номер ${state.userPhone}\nотправлен СМС с кодом',
                              style: AppStyles.subhead.copyWith(
                                color: AppColors.gray,
                              ),
                              textAlign: TextAlign.center,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 36,
                            child: BlocBuilder<AuthFormCubit, AuthFormState>(
                              builder: (context, state) {
                                if (state.timeCount > 0) {
                                  return Text(
                                    'Запросить новый код\nможно через ${state.timeCount} сек.',
                                    style: AppStyles.footnote,
                                  );
                                }

                                return Text(
                                  'Можете запросить\nновый код',
                                  style: AppStyles.footnote.copyWith(
                                    color: AppColors.darkGray,
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 46,
                            width: 160,
                            child: BlocBuilder<AuthFormCubit, AuthFormState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: state.timeCount > 0
                                      ? null
                                      : () {
                                          context.read<SendCodeBloc>().add(
                                              RequestCode(
                                                  phone: phoneController.text));
                                        },
                                  style: AppStyles.greyElevatedButtonOpacity,
                                  child: Center(
                                    child: Text(
                                      'Выслать код',
                                      style: AppStyles.footnoteBold.copyWith(
                                        color: state.timeCount > 0
                                            ? AppColors.darkPrimary
                                                .withOpacity(.5)
                                            : AppColors.darkPrimary,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
