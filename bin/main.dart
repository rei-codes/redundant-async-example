// ignore_for_file: avoid_void_async, avoid-redundant-async

import 'dart:async';

import 'package:benchmark_harness/benchmark_harness.dart';

void a() {}
void b() async {}

class A extends BenchmarkBase {
  const A() : super('A');

  @override
  void run() => a();

  @override
  void exercise() {
    for (var i = 0; i < 100000; i++) {
      run();
    }
  }
}

class B extends BenchmarkBase {
  const B() : super('B');

  @override
  void run() => b();

  @override
  void exercise() {
    for (var i = 0; i < 100000; i++) {
      run();
    }
  }
}

Future<void> c() async {}
Future<void> d() async {}

class C extends BenchmarkBase {
  const C() : super('C');

  @override
  void run() async => await c();

  @override
  void exercise() {
    for (var i = 0; i < 100000; i++) {
      run();
    }
  }
}

class D extends BenchmarkBase {
  const D() : super('D');

  @override
  void run() => unawaited(d());

  @override
  void exercise() {
    for (var i = 0; i < 100000; i++) {
      run();
    }
  }
}

void main() {
  // A().report();
  // B().report();
  C().report();
  D().report();
}
