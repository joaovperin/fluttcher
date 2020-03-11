/// A mixin for loadable classes
mixin Loadable {
  bool loaded = false;
}

///
/// Yields a list as a stream with a delay between each iteration
///
Stream<Loadable> delayedYielder(Duration interval, List<Loadable> list) async* {
  for (var elm in list) {
    elm.loaded = false;
    yield elm;
    await Future.delayed(interval);
    elm.loaded = true;
    yield elm;
  }
}
