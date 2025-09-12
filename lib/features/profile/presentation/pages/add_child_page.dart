import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/config/routes/app_router.dart';
import 'package:monobox/injection_container.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../bloc/add_child/add_child_bloc.dart';
import '../bloc/childrens/childrens_bloc.dart';
import '../widgets/add_child.dart';
import '../widgets/rules_link.dart';

@RoutePage()
class AddChildPage extends StatelessWidget {
  const AddChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AddChildBloc>(),
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (!didPop) {
            final bool? result = await showDialog<bool?>(
                context: context,
                builder: (BuildContext context) {
                  return _confirmBackDialog(context);
                });

            if (result != null && result) {
              if (!context.mounted) return;
              Navigator.of(context).pop();
            }
          }
        },
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(context),
        ),
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
                  'Добавить ребёнка',
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
    return BlocListener<AddChildBloc, AddChildState>(
      listener: (context, state) {
        state.maybeWhen(
          done: (childrens) {
            //context.navigateTo(const AddChildRoute());
            //context.replaceRoute(const ChildrensRoute());
            getIt<ChildrensBloc>().add(const ChildrensEvent.loadChildrens());
            context.replaceRoute(const ChildrensRoute());
            //AutoRouter.of(context).pop();
          },
          orElse: () {},
        );
      },
      child: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: RulesLink(),
            ),
            SizedBox(height: 16),
            AddChild(),
            // SizedBox(
            //   height: 16,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   child: GestureDetector(
            //     //onTap: () => context.navigateTo(const AddChildRoute()),
            //     child: SizedBox(
            //       width: double.infinity,
            //       height: 48,
            //       child: DottedBorder(
            //         borderType: BorderType.RRect,
            //         dashPattern: const [8, 8],
            //         color: AppColors.gray,
            //         radius: Radius.circular(AppStyles.radiusElement),
            //         strokeWidth: 1,
            //         child: Center(
            //           child: Text(
            //             'Сохранить и добавить ещё +',
            //             style: AppStyles.bodyBold.copyWith(color: AppColors.gray),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _confirmBackDialog(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: const Text("Если вы покинете экран, введённые данные будут утеряны"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              "Остаться",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF007AFF),
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              "Выйти",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF007AFF),
              ),
            ),
          ),
        ],
        content: const Text(
          "Восстановить их будет невозможно",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            height: 20 / 14,
            letterSpacing: .25,
            color: Color(0xFF000000),
          ),
        ),
      );
    }

    return AlertDialog(
      title: const Text("Если вы покинете экран, введённые данные будут утеряны"),
      titleTextStyle: AppStyles.title2.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      actionsOverflowButtonSpacing: 20,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text(
            "Остаться",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF007AFF),
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text(
            "Выйти",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF007AFF),
            ),
          ),
        ),
      ],
      content: const Text(
        "Восстановить их будет невозможно",
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: .25,
          color: Color(0xFF000000),
        ),
      ),
    );
  }
}
