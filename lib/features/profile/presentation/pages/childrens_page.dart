import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../injection_container.dart';
import '../bloc/childrens/childrens_bloc.dart';
import '../widgets/childrens_list.dart';
import '../widgets/rules_link.dart';
import '../widgets/add_child.dart';
import '../bloc/add_child/add_child_bloc.dart';

@RoutePage()
class ChildrensPage extends StatelessWidget {
  const ChildrensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
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
              offset: const Offset(0.0, 4.0),
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
                    const SizedBox(width: 16),
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

  Widget _buildBody(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<ChildrensBloc>()..add(const ChildrensEvent.loadChildrens()),
        ),
      ],
      child: BlocConsumer<ChildrensBloc, ChildrensState>(
        listener: (context, state) {
          state.maybeWhen(
            done: (_) {},
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            done: (childrens) {
              if (childrens.isEmpty) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        child: AddChild(
                          key: UniqueKey(),
                          onChildAdded: () {
                            setState(() {});
                            final bloc = context.read<ChildrensBloc>();
                            if (!bloc.isClosed) {
                              bloc.add(const ChildrensEvent.loadChildrens());
                            }
                          },
                        ),
                      ),
                    );
                  },
                );
              }
              else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: RulesLink(),
                      ),
                      const SizedBox(height: 16),
                      ChildrensList(childrens: childrens),
                    ],
                  ),
                );
              }
            },
            loading: () => const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}