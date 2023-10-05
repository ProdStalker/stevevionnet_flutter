import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:stevevionnet/core/screen_config.dart';
import 'package:stevevionnet/features/common/application/helpers/widget_helper.dart';
import 'package:stevevionnet/features/common/presentation/widgets/gradient_container.dart';
import 'package:stevevionnet/features/portfolio/application/configs/portfolio_design.dart';

class ProjectsScreen extends StatefulWidget {
  static const pageConfig = ScreenConfig(
      icon: Icons.work,
      name: "projects",
      child: Placeholder()
  );

  final String? projectType;

  const ProjectsScreen({super.key, this.projectType});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  List<String> _projects = [];

  @override
  void initState() {
    _projects = List.generate(10, (index) => "Project $index");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late Widget child;
    if (!Breakpoints.small.isActive(context)) {
      child = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                widget.projectType ?? "",
                style: WidgetHelper.getTextStyle(PortfolioDesign.projectTitle),
            ),
            Expanded(
                child: body(context)
            )
          ]
      );
    }
    else {
      child = body(context);
    }

    return GradientContainer(
      child: child,
    );
  }

  Widget body(BuildContext context) {

    return ListView.builder(
        itemCount: _projects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_projects[index]),
          );
        },
    );
  }
}
