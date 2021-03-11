part of 'package:disposables/disposables.dart';

/// Represents a collection
abstract class DisposableCollection<D extends Disposable> implements Disposable, List<D> {
  /// Creates a new [DisposableCollection].
  factory DisposableCollection({bool? autoClear}) {
    return DisposableCollection.from([], autoClear: autoClear);
  }

  /// Creates a [DisposableCollection] from list for [Disposable] instances.
  factory DisposableCollection.from(Iterable<D> other, {bool? autoClear}) {
    ArgumentError.checkNotNull(other, "other can't be null");
    return _DisposableList(other.toList(), autoClear ?? false);
  }
}
