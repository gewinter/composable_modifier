import 'package:composable_modifier/composable_modifier.dart';
import 'package:flutter/widgets.dart';

class SizeModifier implements Modifier {
  final Size size;

  SizeModifier(this.size);

  @override
  Widget apply(BuildContext context, Widget child) {
    return SizedBox.fromSize(size: size, child: child);
  }
}

extension Sized on ChainableModifier {
  ChainableModifier sized({required double width, required double height}) {
    return this..addToChain(SizeModifier(Size(width, height)));
  }

  ChainableModifier sizedBy(Size size) {
    return this..addToChain(SizeModifier(size));
  }

  ChainableModifier square(double dimension) {
    return this..addToChain(SizeModifier(Size(dimension, dimension)));
  }
}
