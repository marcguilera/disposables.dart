part of 'package:disposables/disposables.dart';

/// The callback to use when disposing the [Disposable].
typedef void DisposeFunc();

class _BooleanDisposable extends Object with DisposableMixin implements Disposable {
  final DisposeFunc _disposeFunc;

  _BooleanDisposable(this._disposeFunc);

  @override
  void doDispose() {
    _disposeFunc();
  }
}
