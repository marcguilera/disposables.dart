import 'package:disposables/disposables.dart';
import 'package:test/test.dart';

void main() {
  test("Disposing should call disposing func", () {
    bool isDisposed = false;
    final disposable = Disposable(() => isDisposed = true)..dispose();
    expect(isDisposed, isTrue);
    expect(disposable.isDisposed, isTrue);
  });
  test("Disposing should call disposing func", () {
    final areDisposed = List.generate(10, (_) => false);
    final funcs = List.generate(10, (i) => (() => areDisposed[i] = true));
    final disposable = Disposable.compose(funcs)..dispose();

    areDisposed.forEach((isDisposed) => expect(isDisposed, isTrue));
    expect(disposable.isDisposed, isTrue);
  });
  test("Disposing disposables should dispose underlying disposables", () {
    final disposables = List.generate(10, (_) => MockDisposable());
    final disposable = Disposable.fromDisposables(disposables)..dispose();

    disposables.forEach((disposable) => expect(disposable.isDisposed, isTrue));
    expect(disposable.isDisposed, isTrue);
  });
}

class MockDisposable extends Object with DisposableMixin {
  @override
  void doDispose() {}
}