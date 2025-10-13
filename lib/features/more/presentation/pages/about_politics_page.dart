import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:monobox/injection_container.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../bloc/pages/pages_bloc.dart';

@RoutePage()
class AboutPoliticsPage extends StatefulWidget {
  const AboutPoliticsPage({super.key});

  @override
  State<AboutPoliticsPage> createState() => _AboutPoliticsPageState();
}

class _AboutPoliticsPageState extends State<AboutPoliticsPage> {
  late PagesBloc pagesBloc;

  @override
  void initState() {
    pagesBloc = getIt<PagesBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: pagesBloc..add(const PagesEvent.getPage('politica')),
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
                Expanded(
                  child: BlocBuilder<PagesBloc, PagesState>(
                    builder: (context, state) {
                      return Text(
                        state.maybeWhen(
                          orElse: () => 'Политика и соглашения',
                          success: (page) => page.title,
                        ),
                        style: AppStyles.headline.copyWith(height: 1),
                        maxLines: 3,
                      );
                    },
                  ),
                ),
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
    return SingleChildScrollView(
      child: BlocBuilder<PagesBloc, PagesState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            loading: () => const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            ),
            success: (page) => Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                RoundedContainer(
                  child: HtmlWidget(page.content),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
