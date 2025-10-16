import 'package:composable_modifier/src/modifier.dart';
import 'package:flutter/widgets.dart';

class ExpandedModifier implements Modifier {
  final int flex;

  ExpandedModifier({this.flex = 1});

  @override
  Widget apply(BuildContext context, Widget child) => Expanded(flex: flex, child: child);
}

extension Expand on ChainableModifier {
  ChainableModifier expand({int flex = 1}) {
    return this..addToChain(ExpandedModifier(flex: flex));
  }
}
