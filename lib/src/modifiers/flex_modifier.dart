import 'package:composable_modifier/src/modifier.dart';
import 'package:flutter/widgets.dart';

class FlexModifier extends Modifier {
  final int flex;

  FlexModifier({this.flex = 1});

  @override
  Widget apply(BuildContext context, Widget child) {
    return Flexible(flex: flex, child: child);
  }
}

extension Flex on ChainableModifier {
  ChainableModifier flex({int flex = 1}) {
    return this..addToChain(FlexModifier(flex: flex));
  }
}
