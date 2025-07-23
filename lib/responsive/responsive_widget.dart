//responsive widgets
import 'package:flutter/cupertino.dart';
import 'package:responsive_approch/responsive/ResponsiveHelper.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        if (width >= ResponsiveHelper.desktopBreakPoint) {
          return desktop ?? tablet ?? mobile;
        } else if (width >= ResponsiveHelper.mobileBreakpoint) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context,
      BoxConstraints constraints,
      DeviceType deviceType,
      ) builder;

  const ResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        DeviceType deviceType;
        if (constraints.maxWidth >= ResponsiveHelper.desktopBreakPoint) {
          deviceType = DeviceType.desktop;
        } else if (constraints.maxWidth >= ResponsiveHelper.mobileBreakpoint) {
          deviceType = DeviceType.tablet;
        } else {
          deviceType = DeviceType.mobile;
        }
        return builder(context, constraints, deviceType);
      },
    );
  }
}

enum DeviceType { mobile, tablet, desktop }
