import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stevevionnet/core/cubit/navigation_cubit/navigation_todo_cubit.dart';
import 'package:stevevionnet/core/screen_config.dart';
import 'package:stevevionnet/features/common/presentation/widgets/gradient_container.dart';

class ProjectCategoriesScreen extends StatelessWidget {
  static final List<String> _projectCategories = [
    "money",
    "amazon",
    "of"
  ];

  static const pageConfig = ScreenConfig(
      icon: Icons.work,
      name: "portfolio",
      child: ProjectCategoriesScreen()
  );

  const ProjectCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GradientContainer(
      child: ListView.builder(
          itemCount: _projectCategories.length,
          itemBuilder: (context, index) {
            final projectCategory = _projectCategories[index];

            return BlocBuilder<NavigationToDoCubit, NavigationToDoCubitState>(
              buildWhen: (previous, current) {
                return previous.selectedType != current.selectedType;
              },
              builder: (context, state) {
                return ListTile(
                    tileColor: colorScheme.surface,
                    selectedTileColor: colorScheme.surfaceVariant,
                   // iconColor: projectCategory.color.color,
                   // selectedColor: projectCategory.color.color,
                    selected: state.selectedType == projectCategory,
                    onTap: () {
                      context.read<NavigationToDoCubit>().selectedToDoCollectionChanged(projectCategory);

                      if (Breakpoints.small.isActive(context)) {
                        context.pushNamed(ProjectCategoriesScreen.pageConfig.name, pathParameters: {
                          "projectType": projectCategory
                        });
                      }
                    },
                    leading: const Icon(Icons.circle),
                    title: Text(projectCategory)
                );
              },
            );
          }
      ),
    );
  }
}
