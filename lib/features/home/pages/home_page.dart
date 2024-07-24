import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../bloc/home_bloc.dart';
import '../widgets/crazy_card.dart';
import '../widgets/nav_bar.dart';
import '../widgets/sweet_card.dart';
import 'rules_page.dart';
import 'privacy_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 121),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeRules) return const RulesPage();
                if (state is HomePrivacy) return const PrivacyPage();
                if (state is HomeProfile) return const ProfilePage();
                return const _Home();
              },
            ),
          ),
          const CustomAppbar(),
          const NavBar(),
        ],
      ),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 24),
          SweetCard(),
          SizedBox(height: 5),
          CrazyCard(),
        ],
      ),
    );
  }
}
