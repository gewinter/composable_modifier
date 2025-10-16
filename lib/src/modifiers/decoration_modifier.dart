import 'package:composable_modifier/src/modifier.dart';
import 'package:flutter/cupertino.dart';

class DecorationModifier implements Modifier {
  final BoxDecoration decoration;

  DecorationModifier({required this.decoration});

  @override
  Widget apply(BuildContext context, Widget child) {
    return DecoratedBox(decoration: decoration, child: child);
  }
}

extension Decorated on ChainableModifier {
  ChainableModifier decorated(BoxDecoration decoration) {
    return this..addToChain(DecorationModifier(decoration: decoration));
  }
}
