extension ListExtensions<T> on List<T> {
  ///
  /// 조건에 만족하는 원소를 리턴하거나
  /// 만족하는 조건이 없으면 null을 리턴
  ///
  T? firstWhereOrNull(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}
