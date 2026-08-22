import "dart:async";
import "dart:collection";
import "dart:convert";
import "dart:math";
import "dart:typed_data";

import "package:crypto/crypto.dart";
import "package:http/http.dart" as http;

import "../../../core/errors.dart";
import "../../../models/hoyolab_api.dart";

dynamic _parseJson(Uint8List bytes) {
  return const JsonCodec().decode(utf8.decode(bytes));
}

Future<T> errorHandledThen<T>(Future<http.Response> response, T Function(Object? obj) fromJsonT) {
  return response.then((value) {
    final result = HoyolabApiResult.fromJson(_parseJson(value.bodyBytes), fromJsonT);
    if (result.hasError) {
      throw HoyolabApiException(result.retcode, result.message);
    }
    return result.data!;
  });
}

String getDsToken({String body = "", Map<String, String> queryParameters = const {}}) {
  const salt = "okr4obncj8bw5a65hbnn5oo6ixjc3l9w"; // global region (NOT APPLICABLE FOR MAINLAND CHINA)

  final t = (DateTime.now().millisecondsSinceEpoch / 1000).floor();
  final r = 100000 + Random().nextInt(100000);
  final q = queryParameters.entries.map((e) => "${e.key}=${Uri.encodeQueryComponent(e.value)}").join("&");
  final c = md5.convert(utf8.encode("salt=$salt&t=$t&r=$r&b=$body&q=$q"));

  return "$t,$r,${c.toString()}";
}

/// Serializes asynchronous actions and throttles them to at most one per
/// [interval].
///
/// Actions are executed one at a time in FIFO order. [interval] is enforced as
/// a *gap* between the completion of one action and the start of the next, so
/// a slow action does not shorten the wait for the following one. The first
/// action after an idle period runs immediately.
class ApiRequestQueue {
  ApiRequestQueue({required this.interval});

  /// Minimum time between the end of an action and the start of the next one.
  final Duration interval;

  final Queue<Future<void> Function()> _queue = Queue();
  bool _isProcessing = false;
  DateTime? _lastRun;

  /// Enqueues [action] and returns its result once it has been executed.
  ///
  /// If [action] throws, the error (with its stack trace) is forwarded to the
  /// returned future only; the queue keeps processing the remaining actions.
  Future<T> run<T>(FutureOr<T> Function() action) async {
    final completer = Completer<T>();
    _queue.add(() async {
      try {
        final result = await action();
        completer.complete(result);
      } catch (e, st) {
        completer.completeError(e, st);
      }
    });

    if (!_isProcessing) {
      _processQueue();
    }

    return completer.future;
  }

  Future<void> _processQueue() async {
    _isProcessing = true;
    while (_queue.isNotEmpty) {
      final now = DateTime.now();
      if (_lastRun != null && now.difference(_lastRun!) < interval) {
        await Future.delayed(interval - now.difference(_lastRun!));
      }
      final task = _queue.removeFirst();
      await task();
      _lastRun = DateTime.now();
    }
    _isProcessing = false;
  }
}
