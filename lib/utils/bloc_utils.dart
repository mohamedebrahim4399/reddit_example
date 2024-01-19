Future<void> collect<T>({
  required Future<void> Function() task,
  void Function(String)? onError,
  void Function(dynamic)? catchError,
}) async {
  try {
    await task();
  } catch (e) {
    if (onError != null) {
      onError('Un Expected Error');
    }
    if (catchError != null) {
      catchError(e);
    }
  }
}
