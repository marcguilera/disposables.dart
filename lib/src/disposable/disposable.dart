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

/// Callback used in the [using] method.
typedef void DisposableBlock<D extends Disposable>(D disposable);

/// Use a [Disposable] and dispose of it right away.
void using<D extends Disposable>(Disposable disposable, DisposableBlock block) {
  checkNotNull(disposable, message: () => "disposable can't be null");
  checkNotNull(block, message: () => "block can't be null");
  block(disposable);
  disposable.dispose();
}
