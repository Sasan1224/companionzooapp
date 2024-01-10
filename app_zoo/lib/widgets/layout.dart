import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool hasBottomNavigationBar;
  const Layout({
    Key? key,
    required this.body,
    this.bottomNavigationBar,
    this.hasBottomNavigationBar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(child: body),
          bottomNavigationBar:null,
        );
      },
    );
  }
}
