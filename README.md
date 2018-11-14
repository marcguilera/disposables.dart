[![CircleCI](https://circleci.com/gh/marcguilera/disposables.dart.svg?style=svg)](https://circleci.com/gh/marcguilera/disposables.dart)
[![pub package](https://img.shields.io/pub/v/disposables.svg)](https://pub.dartlang.org/packages/disposables)

Simple library to manage objects needing to release its own resources.


## Disposable

```dart
final sink = StreamController();
final disposable = Disposable(() => sink.close());
disposable.dispose();
```

For more complex disposable object you can implement the `Disposable` interface yourself.

```dart
class SomeObject implements Disposable {
  @override
  bool isDisposed = false;
  @override
  void dispose() {
    isDisposed = true;
  }
}
```

## DisposableCollection

```dart
final disposables = [SomeObject(), SomeObject(), disposable];
final collection = DisposableCollection(disposables);
collection.dispose();
```

If you want to compose disposables into without mutating after creation consider using `compose`.

```dart
final disposable = Disposable.compose(disposables);
disposable.dispose();
```
