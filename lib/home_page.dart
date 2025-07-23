import 'package:flutter/material.dart';
import 'package:responsive_approch/responsive/ResponsiveHelper.dart';
import 'package:responsive_approch/responsive/responsive_text_style.dart';
import 'package:responsive_approch/responsive/responsive_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Responsive App',
          style: context.responsiveTitleLarge.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: context.allPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Text(
              'Welcome to Our App!',
              style: context.responsiveHeadlineLarge.copyWith(
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: context.smallSpacing),
            Text(
              'Experience seamless responsiveness across all devices',
              style: context.responsiveBodyMedium.copyWith(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: context.largeSpacing),

            // Responsive Card Section
            ResponsiveWidget(
              mobile: _buildCard(context, 'Mobile View', Colors.blue),
              tablet: _buildCard(context, 'Tablet View', Colors.green),
              desktop: _buildCard(context, 'Desktop View', Colors.orange),
            ),
            SizedBox(height: context.largeSpacing),

            // Features Grid
            Text(
              'Key Features',
              style: context.responsiveHeadlineMedium,
            ),
            SizedBox(height: context.mediumSpacing),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: ResponsiveHelper.getColumnsCount(context),
              childAspectRatio: 1.5,
              crossAxisSpacing: context.smallSpacing,
              mainAxisSpacing: context.smallSpacing,
              children: [
                _buildFeatureCard(context, Icons.phone_android, 'Mobile Friendly'),
                _buildFeatureCard(context, Icons.tablet, 'Tablet Optimized'),
                _buildFeatureCard(context, Icons.desktop_windows, 'Desktop Ready'),
                _buildFeatureCard(context, Icons.text_fields, 'Responsive Text'),
                _buildFeatureCard(context, Icons.spa, 'Adaptive Spacing'),
                _buildFeatureCard(context, Icons.grid_on, 'Smart Layouts'),
              ],
            ),
            SizedBox(height: context.largeSpacing),

            // Device Info Section
            Container(
              padding: context.allPadding,
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Device Info',
                    style: context.responsiveTitleLarge.copyWith(
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: context.smallSpacing),
                  ResponsiveBuilder(
                    builder: (context, constraints, deviceType) {
                      final size = MediaQuery.of(context).size;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Device Type: ${deviceType.toString().split('.').last.toUpperCase()}',
                            style: context.responsiveBodyLarge,
                          ),
                          Text(
                            'Screen Size: ${size.width.toStringAsFixed(0)} × ${size.height.toStringAsFixed(0)}',
                            style: context.responsiveBodyMedium,
                          ),
                          Text(
                            'Orientation: ${MediaQuery.of(context).orientation.toString().split('.').last}',
                            style: context.responsiveBodyMedium,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String text, Color color) {
    return Card(
      elevation: 4,
      color: color,
      child: Padding(
        padding: context.allPadding,
        child: Center(
          child: Text(
            text,
            style: context.responsiveBodyLarge.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, IconData icon, String text) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.smallSpacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: context.responsiveBodyLarge.fontSize! * 2),
            SizedBox(height: context.smallSpacing),
            Text(
              text,
              textAlign: TextAlign.center,
              style: context.responsiveBodyMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}