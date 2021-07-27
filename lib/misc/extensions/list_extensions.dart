extension GenericJoin<T> on List<T> {
  List<T> genericJoin(T seperator) {
    final out = <T>[];
    final iterator = this.iterator;

    if (!iterator.moveNext()) return out;

    out.add(iterator.current);
    while (iterator.moveNext()) {
      out.add(seperator);
      out.add(iterator.current);
    }
    return out;
  }
}
