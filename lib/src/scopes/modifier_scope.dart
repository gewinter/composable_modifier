import 'package:composable_modifier/src/modified.dart';
import 'package:composable_modifier/src/scopes/modifier_scope_provider.dart';
import 'package:composable_modifier/src/scopes/scope_resolver.dart';
import 'package:flutter/widgets.dart';

typedef ScopeDefinition<T> = ComposableModifier Function(T value);

class ModifierScope<T> extends StatelessWidget {
  ModifierScope({super.key, required ScopeDefinition<T> scopeDefinition, required this.child}) : resolver = ScopeResolver<T>(scopeDefinition);

  final ScopeResolver<T> resolver;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ModifierScopeProvider<T>(resolver: resolver, child: child);
  }
}
