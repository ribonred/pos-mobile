import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/constants/app_colors.dart';
import '../../../app/constants/icons.dart';
import '../views/tab/bloc/tab_bloc.dart';

class AppBottomTab extends StatelessWidget {
  const AppBottomTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      color: AppColors.primaryOrange,
      child: BlocBuilder<TabBloc, TabState>(
        buildWhen: (previous, current) =>
            previous.selectedTab != current.selectedTab,
        builder: (context, state) {
          return SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => context
                      .read<TabBloc>()
                      .add(const OnChangedTab(TabPage.menu)),
                  child: const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                GestureDetector(
                  onTap: () => context
                      .read<TabBloc>()
                      .add(const OnChangedTab(TabPage.search)),
                  child: getSvgImage(AppIcons.search, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () => context
                      .read<TabBloc>()
                      .add(const OnChangedTab(TabPage.favorite)),
                  child: getSvgImage(AppIcons.love, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () => context
                      .read<TabBloc>()
                      .add(const OnChangedTab(TabPage.cart)),
                  child: const Icon(
                    Icons.trolley,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
