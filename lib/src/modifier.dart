import 'package:flutter/widgets.dart';

abstract class Modifier {
  Widget apply(BuildContext context, Widget child);
}

class ChainableModifier implements Modifier {
  final List<Modifier> _chain = [];

  void addToChain(Modifier mod) {
    if (mod is ChainableModifier) {
      _chain.addAll(mod._chain);
    } else {
      _chain.add(mod);
    }
  }

  List<Modifier> removeWhere(bool Function(Modifier mod) test) => _chain.getAndRemoveWhere(test);

  List<T> removeWhereType<T extends Modifier>() => _chain.getAndRemoveWhereType<T>();

  @override
  Widget apply(BuildContext context, Widget child) {
    var result = child;

    for (final mod in _chain) {
      result = mod.apply(context, result);
    }

    return result;
  }
}

extension _ListExtension<T> on List<T> {
  List<T> getAndRemoveWhere(bool Function(T item) test) {
    final removed = where(test).toList();
    removeWhere(test);
    return removed;
  }

  List<Tin> getAndRemoveWhereType<Tin extends T>() {
    final removed = whereType<Tin>().toList();
    for (final r in removed) {
      remove(r);
    }
    return removed;
  }
}
