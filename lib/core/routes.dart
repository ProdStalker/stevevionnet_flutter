import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stevevionnet/core/cubit/navigation_cubit/navigation_todo_cubit.dart';
import 'package:stevevionnet/core/go_router_observer.dart';
import 'package:stevevionnet/core/home_page.dart';
import 'package:stevevionnet/features/common/presentation/screens/dashboard_screen.dart';
import 'package:stevevionnet/features/portfolio/presentation/screens/project_categories_screen.dart';
import 'package:stevevionnet/features/portfolio/presentation/screens/projects_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'shell');

const String _basePath = "/app";

final routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '$_basePath/${DashboardScreen.pageConfig.name}',
    observers: [
      GoRouterObserver(),
    ],
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return child;
          },
          routes: [
            GoRoute(
                name: HomePage.pageConfig.name,
                path: '$_basePath/:tab',
                builder: (context, state) {
                  return HomePage(
                    key: state.pageKey,
                    tab: state.pathParameters["tab"]!,
                  );
                }
            )
          ]
      ),
      GoRoute(
        name: ProjectsScreen.pageConfig.name,
        path: '$_basePath/projects/:projectType',
        builder: (context, state) {
          return BlocListener<NavigationToDoCubit, NavigationToDoCubitState>(
            listenWhen: (previous, current) => previous.isSecondBodyDisplayed != current.isSecondBodyDisplayed,
            listener: (context, state) {
              if (context.canPop() && (state.isSecondBodyDisplayed ?? false)) {
                context.pop();
              }
            },
            child: Scaffold(
                appBar: AppBar(
                  leading: BackButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      }
                      else {
                        context.goNamed(
                            HomePage.pageConfig.name,
                            pathParameters: {
                              "tab": ProjectCategoriesScreen.pageConfig.name
                            }
                        );
                      }
                    },
                  ),
                  title: Text(
                      state.pathParameters["projectType"] ?? "Projects"
                  ),
                ),
                body: ProjectsScreen(
                  projectType: state.pathParameters["projectType"],
                )
            ),
          );
        },
      )
    ]
);