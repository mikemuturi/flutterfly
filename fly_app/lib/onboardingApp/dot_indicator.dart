import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;
  const DotIndicator({super.key, this.isActive =false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 8,
      width: isActive?24:8,

      decoration: BoxDecoration(
        border: isActive?null:Border.all(color: Colors.grey),
        color: isActive?Colors.red:Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}