part of 'package:disposables/disposables.dart';

class _DisposableList<D extends Disposable> extends DelegatingList<D>
    implements DisposableCollection<D> {
  @override
  final List<D> delegate;
  final bool autoClear;

  @override
  bool get isDisposed => !any((disposable) => !isDisposed);

  _DisposableList(this.delegate, this.autoClear);

  @override
  void dispose() {
    forEach((disposable) => disposable.dispose());
    if (autoClear) clear();
  }
}
