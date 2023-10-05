import 'package:flutter/material.dart';
import 'package:stevevionnet/core/screen_config.dart';
import 'package:stevevionnet/features/common/presentation/widgets/gradient_container.dart';

class DashboardScreen extends StatelessWidget {
  static const pageConfig = ScreenConfig(
      icon: Icons.dashboard_rounded,
      name: "dashboard",
      child: DashboardScreen()
  );

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientContainer();
  }
}
