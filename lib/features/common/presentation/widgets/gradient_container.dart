import 'package:flutter/material.dart';
import 'package:stevevionnet/features/common/application/configs/common_design.dart';

class GradientContainer extends StatelessWidget {
  final Widget? child;

  const GradientContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final Color bgColor = CommonDesign.randomColor();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            bgColor.withOpacity(0.3),
            bgColor.withOpacity(0.6),
            bgColor.withOpacity(0.8),
          ]
        )
      ),
      child: child,
    );
  }

}