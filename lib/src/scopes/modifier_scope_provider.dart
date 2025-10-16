import 'package:composable_modifier/composable_modifier.dart';
import 'package:composable_modifier/src/scopes/scope_resolver.dart';
import 'package:flutter/widgets.dart';

class ModifierScopeProvider<T> extends InheritedWidget {
  const ModifierScopeProvider({super.key, required this.resolver, required this.child}) : super(child: child);

  final ScopeResolver<T> resolver;
  final Widget child;

  static ModifierScopeProvider? of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ModifierScopeProvider<T>>();
  }

  static Modifier? resolve<T>(BuildContext context, T value) {
    final scope = ModifierScopeProvider.of<T>(context);
    if (scope == null) return null;

    return scope.resolver.resolve(value);
  }

  @override
  bool updateShouldNotify(ModifierScopeProvider oldWidget) {
    return true;
  }
}
