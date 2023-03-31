import 'package:flutter/material.dart';
import 'package:time_tracker/hero_divider.dart';
import 'package:time_tracker/nav_bar.dart';

class Skeleton extends StatelessWidget {
  final Widget upper;
  final Widget lower;
  final NavBar navBar;

  const Skeleton({
    super.key,
    required this.navBar,
    required this.upper,
    required this.lower,
  });

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height / 5;

    return Column(
      children: <Widget>[
        Expanded(
          child: FlexContainer(first: upper, second: lower),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight,
          ),
          child: navBar,
        )
      ],
    );
  }
}

class FlexContainer extends StatelessWidget {
  const FlexContainer({
    super.key,
    required this.first,
    required this.second,
  });

  final Widget first;
  final Widget second;

  @override
  Widget build(BuildContext context) {
    Column verticalLayout = Column(
      children: [
        Expanded(
          flex: 2,
          child: first,
        ),
        const HeroDivider(),
        Expanded(
          child: second,
        ),
      ],
    );
    Row horizontalLayout = Row(
      children: [
        Expanded(
          flex: 2,
          child: first,
        ),
        const VerticalHeroDivider(),
        Expanded(
          child: second,
        ),
      ],
    );
    Size screenSize = MediaQuery.of(context).size;
    return screenSize.width > screenSize.height
        ? horizontalLayout
        : verticalLayout;
  }
}
