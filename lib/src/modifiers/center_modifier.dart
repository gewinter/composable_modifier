import 'package:composable_modifier/src/modifier.dart';
import 'package:flutter/widgets.dart';

class CenterModifier implements Modifier {
  @override
  Widget apply(BuildContext context, Widget child) {
    return Center(child: child);
  }
}

extension Centered on ChainableModifier {
  ChainableModifier centered() {
    return this..addToChain(CenterModifier());
  }
}
