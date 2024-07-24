import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/home_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 68 + MediaQuery.of(context).viewPadding.bottom,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffC09CF9),
              Color(0xff96AAFA),
            ],
          ),
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NavBarButton(
                  asset: 'tab1',
                  title: 'Home',
                  active: state is HomeInitial,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 0));
                  },
                ),
                _NavBarButton(
                  asset: 'tab3',
                  title: 'Rules',
                  active: state is HomeRules,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 1));
                  },
                ),
                _NavBarButton(
                  asset: 'tab4',
                  title: 'Privacy',
                  active: state is HomePrivacy,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 2));
                  },
                ),
                _NavBarButton(
                  asset: 'tab5',
                  title: 'Profile',
                  active: state is HomeProfile,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 3));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.asset,
    required this.title,
    required this.active,
    required this.onPressed,
  });

  final String asset;
  final String title;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: active ? const Color(0xff9083EF) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              'assets/$asset.svg',
              color: Colors.white,
              height: 24,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
