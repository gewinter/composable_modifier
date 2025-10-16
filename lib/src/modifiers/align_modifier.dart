import 'package:composable_modifier/src/modifier.dart';
import 'package:flutter/widgets.dart';

class AlignModifier implements Modifier {
  final AlignmentGeometry alignment;

  AlignModifier(this.alignment);

  @override
  Widget apply(BuildContext context, Widget child) {
    return Align(alignment: alignment, child: child);
  }
}

extension Aligned on ChainableModifier {
  ChainableModifier aligned(AlignmentGeometry alignment) {
    return this..addToChain(AlignModifier(alignment));
  }
}
