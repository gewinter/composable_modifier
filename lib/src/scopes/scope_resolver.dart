import 'package:composable_modifier/src/modifier.dart';
import 'package:composable_modifier/src/scopes/modifier_scope.dart';

class ScopeResolver<T> {
  final ScopeDefinition<T> scopeDefinition;

  ScopeResolver(this.scopeDefinition);

  Modifier resolve(T value) {
    final mod = ChainableModifier();
    scopeDefinition(value).call(mod);
    return mod;
  }
}
