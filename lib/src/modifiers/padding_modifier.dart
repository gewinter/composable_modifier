import 'package:composable_modifier/src/modifier.dart';
import 'package:flutter/widgets.dart';

class PaddingModifier implements Modifier {
  final EdgeInsetsGeometry padding;

  PaddingModifier({required this.padding});

  @override
  Widget apply(BuildContext context, Widget child) => Padding(padding: padding, child: child);
}

extension Padded on ChainableModifier {
  ChainableModifier padded(EdgeInsetsGeometry padding) {
    return this..addToChain(PaddingModifier(padding: padding));
  }
}
