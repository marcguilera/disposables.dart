part of 'package:disposables/disposables.dart';

/// Helper mixin to abstract away the `isDisposed` logic.
abstract class DisposableMixin implements Disposable {
  @override
  bool isDisposed = false;

  @override
  void dispose() {
    if (!isDisposed) {
      doDispose();
      isDisposed = true;
    }
  }

  void doDispose();
}
