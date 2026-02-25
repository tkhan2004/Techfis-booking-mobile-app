import 'package:flutter/material.dart';

/// Scaffold reusable — áp dụng pattern của HomePage:
/// nền trắng + background_logo.png cắt nền đặt trên + content lên trên cùng
class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomInset;

  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_logo.png',
              fit: BoxFit.fitWidth,
              alignment: Alignment.centerRight,
            ),
          ),
          body,
        ],
      ),
    );
  }
}
