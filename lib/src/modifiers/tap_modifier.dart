import 'package:composable_modifier/src/modifier.dart';
import 'package:flutter/material.dart';

class TapModifier extends Modifier {
  final VoidCallback onTap;

  TapModifier({required this.onTap});

  @override
  Widget apply(BuildContext context, Widget child) {
    return GestureDetector(onTap: onTap, child: child);
  }
}

extension Tappable on ChainableModifier {
  ChainableModifier tappable(VoidCallback onTap) {
    final existingTapModifiers = removeWhereType<TapModifier>();
    return this..addToChain(
      TapModifier(
        onTap: () {
          for (final mod in existingTapModifiers) {
            mod.onTap();
          }
          onTap();
        },
      ),
    );
  }
}
