import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/rounded_container.dart';
import 'package:monobox/features/more/presentation/bloc/menu_bloc.dart';
import 'widgets/contact_button.dart';
import 'widgets/menu_list.dart';
import 'widgets/more_app_bar.dart';
import 'widgets/powered_by.dart';
import 'widgets/social_section.dart';

@RoutePage()
class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  void initState() {
    super.initState();
    context.read<MenuBloc>().add(const GetMenu());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MoreAppBar(),
      body: _MorePageBody(),
    );
  }
}

class _MorePageBody extends StatelessWidget {
  const _MorePageBody();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          RoundedContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuList(),
                SizedBox(height: 32),
                ContactButton(),
                SizedBox(height: 32),
                SocialSection(),
              ],
            ),
          ),
          SizedBox(height: 20),
          PoweredBy(),
          SizedBox(height: 51),
        ],
      ),
    );
  }
}
