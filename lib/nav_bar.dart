import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final bool running;
  final Function() left;
  final Function()? right;
  final Function() middle;
  final IconData iconLeft;
  final Widget iconMiddle;
  final IconData? iconRight;
  final String labelLeft;
  final String? labelRight;

  const NavBar({
    super.key,
    required this.running,
    required this.left,
    required this.iconLeft,
    required this.labelLeft,
    required this.middle,
    required this.iconMiddle,
    this.right,
    this.iconRight,
    this.labelRight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Row(
        children: [
          Expanded(
            child: FittedBox(
              child: SizedBox(
                width: 400,
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: FloatingActionButton.extended(
                          heroTag: "left",
                          foregroundColor:
                              Theme.of(context).colorScheme.primary,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          onPressed: left,
                          label: Opacity(
                            opacity: 0.5,
                            child: Text(labelLeft),
                          ),
                          icon: Opacity(
                            opacity: 0.5,
                            child: Icon(iconLeft),
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton.large(
                      heroTag: "middle",
                      backgroundColor: running
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.primary,
                      onPressed: middle,
                      child: iconMiddle,
                    ),
                    right != null && labelRight != null && iconRight != null
                        ? Expanded(
                            child: Center(
                              child: FloatingActionButton.extended(
                                heroTag: "right",
                                foregroundColor:
                                    Theme.of(context).colorScheme.primary,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                onPressed: right,
                                label: Opacity(
                                  opacity: 0.5,
                                  child: Text(labelRight!),
                                ),
                                icon: Opacity(
                                  opacity: 0.5,
                                  child: Icon(iconRight),
                                ),
                              ),
                            ),
                          )
                        : const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
