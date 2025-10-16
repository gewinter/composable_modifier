import 'package:composable_modifier/src/modifier.dart';
import 'package:flutter/widgets.dart';

class ColorModifier implements Modifier {
  final Color color;

  ColorModifier({required this.color});

  @override
  Widget apply(BuildContext context, Widget child) => ColoredBox(color: color, child: child);
}

extension Colored on ChainableModifier {
  ChainableModifier colored(Color color) {
    return this..addToChain(ColorModifier(color: color));
  }
}
