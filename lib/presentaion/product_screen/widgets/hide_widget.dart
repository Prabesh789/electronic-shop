import 'package:flutter/material.dart';

class HideWidget extends StatefulWidget {
  const HideWidget({
    Key? key,
    required this.scrollController,
    required this.widget,
  }) : super(key: key);

  final ScrollController scrollController;
  final Widget widget;

  @override
  State<HideWidget> createState() => _HideWidgetState();
}

class _HideWidgetState extends State<HideWidget> {
  bool makeVisible = true;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(listen);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(listen);
    super.dispose();
  }

  void listen() {
    final scrollDir = widget.scrollController.position.pixels;
    if (scrollDir >= 25) {
      hide();
    } else {
      show();
    }
  }

  void show() {
    if (!makeVisible) {
      setState(() {
        makeVisible = true;
      });
    }
  }

  void hide() {
    if (makeVisible) {
      setState(() {
        makeVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
      child: makeVisible ? widget.widget : const SizedBox(),
    );
  }
}
