part of 'package:disposables/disposables.dart';

/// Represents an object able to release it's resources.
abstract class Disposable {
  /// Whether this [Disposable] has already released its resources.
  bool get isDisposed;

  /// Releases this [Disposable] resources.
  void dispose();

  /// Creates a [Disposable] from a callback.
  factory Disposable(DisposeFunc disposeFunc) {
    checkNotNull(disposeFunc, message: () => "disposeFunc can't be null");
    return _BooleanDisposable(disposeFunc);
  }

  /// Composes many [DisposeFunc] into one.
  factory Disposable.compose(Iterable<DisposeFunc> disposeFuncs) {
    checkNotNull(disposeFuncs, message: () => "disposeFuncs can't be null");
    return Disposable.fromDisposables(
        disposeFuncs.map((disposeFunc) => Disposable(disposeFunc)));
  }

  /// Composes many [Disposable] instances to be disposed together.
  factory Disposable.fromDisposables(Iterable<Disposable> disposables) {
    checkNotNull(disposables, message: () => "disposables can't be null");
    return DisposableCollection.from(disposables, autoClear: true);
  }
}
