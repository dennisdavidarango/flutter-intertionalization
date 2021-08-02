import 'package:flutter/material.dart';
import 'package:test_internationalization/components/InfinityScroll.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: InfinityScroll()),
    );
  }
}
