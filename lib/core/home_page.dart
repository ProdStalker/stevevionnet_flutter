import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stevevionnet/core/cubit/navigation_cubit/navigation_todo_cubit.dart';
import 'package:stevevionnet/core/screen_config.dart';
import 'package:stevevionnet/features/common/presentation/screens/dashboard_screen.dart';
import 'package:stevevionnet/features/portfolio/presentation/screens/project_categories_screen.dart';
import 'package:stevevionnet/features/portfolio/presentation/screens/projects_screen.dart';

class HomePage extends StatefulWidget {
  static const pageConfig = ScreenConfig(
    icon: Icons.home_rounded,
    name: "home",
  );

  static const tabs =  [
    DashboardScreen.pageConfig,
    ProjectCategoriesScreen.pageConfig
  ];

  int index;

  HomePage({super.key, required String tab}) : index = tabs.indexWhere((element) => element.name == tab);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final destinations = HomePage.tabs.map(
          (page) => NavigationDestination(icon: Icon(page.icon), label: page.name)
  ).toList();

  void _tapOnNavigationDestination(BuildContext context, int index) {
    context.goNamed(
        HomePage.pageConfig.name,
        pathParameters: {
          "tab": HomePage.tabs[index].name
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          primaryNavigation: SlotLayout(
              config: <Breakpoint, SlotLayoutConfig> {
                Breakpoints.mediumAndUp: SlotLayout.from(
                    key: const Key('primary-navigation-medium'),
                    builder: (context) {
                      return AdaptiveScaffold.standardNavigationRail(
                          leading: null,
                          trailing: null,
                          selectedIndex: widget.index,
                          selectedLabelTextStyle: TextStyle(
                              color: theme.colorScheme.onBackground
                          ),
                          selectedIconTheme: IconThemeData(
                              color: theme.colorScheme.onBackground
                          ),
                          unselectedIconTheme: IconThemeData(
                              color: theme.colorScheme.onBackground.withOpacity(0.5)
                          ),
                          onDestinationSelected: (index) {
                            debugPrint('tap $index selected');
                            _tapOnNavigationDestination(context, index);
                          },
                          destinations: destinations.map((_) => AdaptiveScaffold.toRailDestination(_)).toList()
                      );
                    }
                )
              }
          ),
          bottomNavigation: SlotLayout(
              config: <Breakpoint, SlotLayoutConfig> {
                Breakpoints.small: SlotLayout.from(
                    key: const Key("bottom-navigation-small"),
                    builder: (_) {
                      return AdaptiveScaffold.standardBottomNavigationBar(
                          currentIndex: widget.index,
                          onDestinationSelected: (index) {
                            debugPrint('bottom tap $index selected');
                            _tapOnNavigationDestination(context, index);
                          },
                          destinations: destinations
                      );
                    }
                ),
              }
          ),
          body: SlotLayout(
              config: <Breakpoint, SlotLayoutConfig>{
                Breakpoints.smallAndUp: SlotLayout.from(
                    key: const Key("primary-body-small"),
                    builder: (_) => HomePage.tabs[widget.index].child
                )
              }
          ),
          secondaryBody: SlotLayout(
              config: <Breakpoint, SlotLayoutConfig>{
                Breakpoints.mediumAndUp: SlotLayout.from(
                  key: const Key("secondary-body-medium"),
                  builder: widget.index != 1 ? null : (context) {
                    return BlocBuilder<NavigationToDoCubit, NavigationToDoCubitState>(
                      builder: (context, state) {
                        final selectedId = state.selectedType;
                        final isSecondBodyDisplayed = Breakpoints.mediumAndUp.isActive(context);

                        context.read<NavigationToDoCubit>().secondBodyHasChanged(isSecondBodyDisplayed: isSecondBodyDisplayed);


                        if (selectedId == null) {
                          return const Placeholder();
                        }

                        return ProjectsScreen(
                            key: Key(selectedId),
                            projectType: state.selectedType!
                        );
                      },
                    );
                  },
                )
              }
          ),
        ),
      ),
    );
  }
}
