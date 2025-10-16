import 'package:composable_modifier/src/modifier.dart';
import 'package:composable_modifier/src/scopes/modifier_scope_provider.dart';
import 'package:flutter/widgets.dart';

typedef ComposableModifier = void Function(ChainableModifier modifier);

class Modified<TClass> extends StatelessWidget {
  const Modified({super.key, this.modBuilder, this.classes = const [], required this.child});

  final ComposableModifier? modBuilder;
  final Widget child;
  final List<TClass> classes;

  @override
  Widget build(BuildContext context) {
    final mod = ChainableModifier();
    for (final cls in classes) {
      final classMod = ModifierScopeProvider.resolve<TClass>(context, cls);
      if (classMod != null) {
        mod.addToChain(classMod);
      }
    }

    modBuilder?.call(mod);

    return mod.apply(context, child);
  }
}
